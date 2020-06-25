import 'package:ebookApp/Components/bookDetails/bookDetailsBottomButtons.dart';
import 'package:ebookApp/Components/bookDetails/bookDetailsHeader.dart';
import 'package:ebookApp/Components/bookDetails/bookDetailsMainContent.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  const BookDetails(
      {Key key,
      @required this.thumbnail,
      @required this.title,
      @required this.pdfLink});
  final thumbnail;
  final title;
  final pdfLink;

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails>
    with SingleTickerProviderStateMixin {
  int _cIndex = 0;
  TabController tabController;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: <Widget>[
          ListView(
            children: <Widget>[
              BookDetailsHeader(thumbnail: this.widget.thumbnail),
              BookDetailsMainContent(
                  tabController: tabController, title: this.widget.title),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
          BookDetailsBottomButtons(
            pdfLink: this.widget.pdfLink,
            title: this.widget.title,
          ),
        ]),
      ),
    );
  }
}
