import 'package:ebookApp/styles.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  const BookList({
    Key key,
    @required this.booksList,
    @required this.listTitle,
    this.searchData,
    this.showSearchBar = false,
    this.showAllBooksButton = false,
  }) : super(key: key);

  final booksList;
  final listTitle;
  final showSearchBar;
  final showAllBooksButton;
  final searchData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DecorationLine(),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                listTitle,
                style: kHeadingStyle,
                textAlign: TextAlign.left,
              ),
              showAllBooksButton
                  ? MaterialButton(
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Text(
                            'All Books',
                            style: kCardBookStyle.copyWith(
                              color: Colors.grey,
                              fontSize: 20.0,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    )
                  : Container()
            ],
          ),
        ),
        Column(
          children: booksList,
        ),
      ],
    );
  }
}
