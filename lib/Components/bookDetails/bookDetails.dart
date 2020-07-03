import 'package:ebookApp/Components/bookDetails/bookDetailsBottomButtons.dart';
import 'package:ebookApp/Components/bookDetails/bookDetailsHeader.dart';
import 'package:ebookApp/Components/bookDetails/bookDetailsMainContent.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({
    Key key,
    @required this.book,
  });
  final book;

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails>
    with SingleTickerProviderStateMixin {
  int _cIndex = 0;
  TabController tabController;

  Future<void> addToDownloads(String pdfPath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> storedDownloads = (prefs.getStringList('downloads') ?? []);
    print("storedDownloads");
    print(storedDownloads);
    String currentBook =
        """{"title": "${widget.book.title}","thumbnail": "${widget.book.thumbnail}","pdfLink": "${widget.book.pdfLink}","tag": "${widget.book.tag}" ,"category": "${widget.book.category}","pdfPath": "$pdfPath","description": "${widget.book.description}", "isBookmarked": "false", "isDownloaded": "true" }""";
    storedDownloads.add(currentBook);
    await prefs.setStringList('downloads', storedDownloads);
  }

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
              BookDetailsHeader(thumbnail: this.widget.book.thumbnail),
              BookDetailsMainContent(
                  tabController: tabController, title: this.widget.book.title),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
          BookDetailsBottomButtons(
            pdfLink: this.widget.book.pdfLink,
            title: this.widget.book.title,
            onDownload: this.addToDownloads,
            isDownloaded: this.widget.book.isDownloaded,
          ),
        ]),
      ),
    );
  }
}
