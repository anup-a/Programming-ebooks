import 'dart:convert';

import 'package:ebookApp/Components/bookListItem.dart';
import 'package:ebookApp/models/book.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarksData {
  List<BookListItem> _generateBookObjects = [];

  Future<List<Map<String, dynamic>>> getBookmarksJSONData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> rawJsonData = prefs.getStringList('bookmarks');
    List<Map<String, dynamic>> bookmarksJsonData = [];
    if (rawJsonData != null) {
      for (var bookJson in rawJsonData) {
        bookmarksJsonData.add(jsonDecode(bookJson));
      }
    }
    return bookmarksJsonData;
  }

  Future<void> getObjectFromJSON() async {
    List<Map<String, dynamic>> bookmarksJSONData = await getBookmarksJSONData();
    for (var book in bookmarksJSONData) {
      Book newbook = Book.fromJson(book);
      this._generateBookObjects.add(
            BookListItem(
              book: newbook,
            ),
          );
    }
  }

  List<BookListItem> getBookmarkedBooks() {
    return this._generateBookObjects;
  }
}
