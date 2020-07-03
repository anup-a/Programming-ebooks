import 'package:flutter/material.dart';
import 'package:ebookApp/db/allBooks.dart';

class BookCardsNav extends StatelessWidget {
  const BookCardsNav({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.black.withOpacity(0.05),
          ),
      height: 260.0,
      padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: allBookCards,
      ),
    );
  }
}
