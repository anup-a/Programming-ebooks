import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:ebookApp/Components/PDFview/bookPDFview.dart';
import 'package:ebookApp/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsBottomButtons extends StatelessWidget {
  const BookDetailsBottomButtons({this.pdfLink, this.title});
  final pdfLink;
  final title;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          // color: Color(0XFFE5E5E5),
          color: Colors.white,
          // border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 15.0, // soften the shadow
              spreadRadius: 2.0, //extend the shadow
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailsPDFview(
                      pdfLink: pdfLink,
                      title: title,
                    ),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.bookmark_border),
                  SizedBox(height: 2.0),
                  Text('Read Book', style: kBottomNavItemStyle)
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Icon(Icons.file_download),
                SizedBox(height: 2.0),
                Text('Download', style: kBottomNavItemStyle)
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.share),
                SizedBox(height: 2.0),
                Text('Share Link', style: kBottomNavItemStyle)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
