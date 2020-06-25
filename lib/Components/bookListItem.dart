import 'package:ebookApp/bookDetails.dart';
import 'package:ebookApp/styles.dart';
import 'package:flutter/material.dart';

class BookListItem extends StatelessWidget {
  const BookListItem({this.title, this.category, this.thumbnail, this.pdfLink});
  final title;
  final category;
  final thumbnail;
  final pdfLink;

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
                    thumbnail,
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
                        thumbnail: thumbnail,
                        title: title,
                        pdfLink: pdfLink,
                      ),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: kBookListNameStyle,
                      // overflow: TextOverflow.fade,
                    ),
                    Text(
                      category,
                      style: kBookListCaetgoryStyle,
                    )
                  ],
                ),
              ),
            ),
            MaterialButton(
              minWidth: 50.0,
              height: 50.0,
              child: Icon(
                Icons.collections_bookmark,
                size: 30.0,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ]),
    );
  }
}
