import 'package:ebookApp/Components/HomePage/bookCardNav.dart';
import 'package:ebookApp/Components/bookLIst.dart';
import 'package:ebookApp/Components/bookListItem.dart';
import 'package:ebookApp/Components/searchBar.dart';
import 'package:ebookApp/Components/topBooksList.dart';
import 'package:ebookApp/db/allBooks.dart';
import 'package:ebookApp/db/bookmarks.dart';
import 'package:ebookApp/drawerScreen.dart';
import 'package:ebookApp/icons.dart';
import 'package:ebookApp/styles.dart';
import 'package:flutter/material.dart';

class BookmarkList extends StatefulWidget {
  BookmarkList({Key key}) : super(key: key);

  @override
  _BookmarkListState createState() => _BookmarkListState();
}

class _BookmarkListState extends State<BookmarkList> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1.0;
  bool isDrawerOpen = false;
  bool booksLoading = true;
  List<BookListItem> bookmarkBooksList = [];

  Future<void> fetchBookObjects() async {
    BookmarksData bookmarksData = BookmarksData();
    await bookmarksData.getObjectFromJSON();
    setState(() {
      bookmarkBooksList = bookmarksData.getBookmarkedBooks();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchBookObjects();
    setState(() {
      booksLoading = false;
    });
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
                      'Bookmarks',
                      style: kHeadingStyle,
                    ),
                  ),
                  Expanded(
                    child: booksLoading
                        ? SizedBox(
                            height: 50.0,
                            width: 50.0,
                            child: CircularProgressIndicator())
                        : BookList(bookList: bookmarkBooksList),
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
