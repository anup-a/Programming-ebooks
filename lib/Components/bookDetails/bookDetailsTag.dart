import 'package:ebookApp/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsTag extends StatelessWidget {
  const BookDetailsTag({this.tagName});
  final tagName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonTheme(
        minWidth: 50.0,
        child: RaisedButton(
          elevation: 0.0,
          focusElevation: 0.0,
          highlightElevation: 0.0,
          onPressed: () {},
          child: Text(
            tagName,
            style: kTagStyle,
          ),
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
