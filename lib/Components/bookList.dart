import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  BookList({this.bookList});
  final bookList;
  @override
  Widget build(BuildContext context) {
    // return ListView.builder(itemCounts: ,itemBuilder: (context, index) => BookListItem());
    return ListView.builder(
        itemCount: bookList.length,
        itemBuilder: (context, index) => bookList[index]);
  }
}
