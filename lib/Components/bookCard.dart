import 'package:ebookApp/bookDetails.dart';
import 'package:ebookApp/styles.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({this.thumbnail, this.title});
  final thumbnail;
  final title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetails(
              thumbnail: thumbnail,
              title: title,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        width: 150.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              height: 130.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    thumbnail,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Text(
                title,
                style: kCardBookStyle,
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
              ),
            )
          ],
        ),
      ),
    );
  }
}
