import 'package:ebookApp/Components/bookDetails/bookDetails.dart';
import 'package:ebookApp/db/bookmarks.dart';
import 'package:ebookApp/models/book.dart';
import 'package:ebookApp/styles.dart';
import 'package:flutter/material.dart';
import 'package:ebookApp/configuration.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookListItem extends StatefulWidget {
  final Book book;
  const BookListItem({this.book});

  @override
  _BookListItemState createState() => _BookListItemState();
}

class _BookListItemState extends State<BookListItem> {
  bool isBookmarked = false;

  void updateBookmark() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> storedBookmarks = (prefs.getStringList('bookmarks') ?? []);
    print("storedBookmarks");
    print(storedBookmarks);
    String currentBook =
        """{"title": "${widget.book.title}","thumbnail": "${widget.book.thumbnail}","pdfLink": "${widget.book.pdfLink}","tag": "${widget.book.tag}" ,"category": "${widget.book.category}","pdfPath": "${widget.book.pdfPath}","description": "${widget.book.description}", "isBookmarked": "true" }""";
    storedBookmarks.add(currentBook);
    print("book pushed");
    await prefs.setStringList('bookmarks', storedBookmarks);
    setState(() {
      if (isBookmarked) {
        isBookmarked = false;
      } else {
        isBookmarked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              width: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.book.thumbnail,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetails(
                        book: widget.book,
                      ),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.book.title,
                          style: kBookListNameStyle,
                        ),
                      ),
                    ),
                    Text(
                      widget.book.category,
                      style: kBookListCaetgoryStyle,
                    )
                  ],
                ),
              ),
            ),
            IconButton(
              icon: (widget.book.isBookmarked.parseBool() || isBookmarked)
                  ? Icon(Icons.collections_bookmark)
                  : Icon(Icons.bookmark),
              iconSize: 30.0,
              color: Colors.black,
              onPressed: updateBookmark,
            )
          ]),
    );
  }
}
