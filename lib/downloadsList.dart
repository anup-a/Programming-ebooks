import 'package:ebookApp/Components/bookLIst.dart';
import 'package:ebookApp/Components/searchBar.dart';
import 'package:ebookApp/db/bookmarks.dart';
import 'package:ebookApp/db/downloads.dart';
import 'package:ebookApp/drawerScreen.dart';
import 'package:ebookApp/icons.dart';
import 'package:ebookApp/styles.dart';
import 'package:flutter/material.dart';

class DownloadsList extends StatefulWidget {
  DownloadsList({Key key}) : super(key: key);

  @override
  _DownloadsListState createState() => _DownloadsListState();
}

class _DownloadsListState extends State<DownloadsList> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1.0;
  bool isDrawerOpen = false;
  List<Widget> downloadedBookList = [];

  Future<void> fetchBookObjects() async {
    DownloadsData downloadsData = DownloadsData();
    await downloadsData.getObjectFromJSON();
    setState(() {
      downloadedBookList = downloadsData.getDownloadedBooks();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchBookObjects();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            DrawerScreen(),
            AnimatedContainer(
              transform: Matrix4.translationValues(xOffset, yOffset, 0)
                ..scale(scaleFactor)
                ..rotateY(isDrawerOpen ? -0.5 : 0),
              duration: Duration(milliseconds: 250),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
                boxShadow: kBoxShadowWidgetStyle,
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        isDrawerOpen
                            ? IconButton(
                                icon: Icon(Icons.arrow_back_ios),
                                onPressed: () {
                                  setState(() {
                                    xOffset = 0;
                                    yOffset = 0;
                                    scaleFactor = 1;
                                    isDrawerOpen = false;
                                  });
                                },
                              )
                            : IconButton(
                                icon: Icon(
                                  MyFlutterApp.noun_mobile_menu_345384,
                                  size: 35.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    xOffset = 230;
                                    yOffset = 150;
                                    scaleFactor = 0.6;
                                    isDrawerOpen = true;
                                  });
                                },
                              ),
                        CircleAvatar(
                          radius: 20.0,
                          backgroundImage: NetworkImage(
                              "https://c.pxhere.com/photos/01/99/adult_beard_black_and_white_denim_jacket_facial_expression_facial_hair_fashion_fine_looking-1501223.jpg!d"),
                        ),
                      ],
                    ),
                  ),
                  SearchBar(),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      'Downloads',
                      style: kHeadingStyle,
                    ),
                  ),
                  Expanded(
                    child: BookList(bookList: downloadedBookList),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
