import 'package:ebookApp/Components/bookDetails/bookDetailsTabBar.dart';
import 'package:ebookApp/Components/bookDetails/bookDetailsTag.dart';
import 'package:ebookApp/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsMainContent extends StatelessWidget {
  const BookDetailsMainContent({
    Key key,
    @required this.tabController,
    @required this.title,
  }) : super(key: key);

  final TabController tabController;
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.10),
      child: Container(
        padding: EdgeInsets.all(40.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              title,
              style: kWelcomeStyle,
            ),
            Wrap(
              children: <Widget>[
                BookDetailsTag(
                  tagName: 'Data Structures',
                ),
                BookDetailsTag(tagName: 'Algorithms'),
                BookDetailsTag(tagName: 'C'),
                // BookDetailsTag(),
              ],
            ),
            BookDetailsTabBar(tabController: tabController),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Quickly learn how to automate unit testing of Python 3 code with Python 3 automation libraries, such as doctest, unittest, nose, nose2, and pytest.\n\n This book explores the important concepts in software testing and their implementation in Python 3 and shows you how to automate, organize, and execute unit tests for this language. This knowledge is often acquired by reading source code, manuals, and posting questions on community forums, which tends to be a slow and painful process.\n',
                style: kBookDescriptionStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
