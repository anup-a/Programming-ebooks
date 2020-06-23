import 'package:ebookApp/Components/bookCard.dart';
import 'package:flutter/material.dart';

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
        children: <Widget>[
          BookCard(
              thumbnail:
                  "https://i1.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/C-and-XML-Primer.jpg?w=330&ssl=1",
              title: 'C# and XML Primer'),
          SizedBox(
            width: 15.0,
          ),
          BookCard(
            thumbnail:
                "https://i0.wp.com/www.programmer-books.com/wp-content/uploads/2019/01/Angular-2-Development-with-TypeScript.jpg?w=720&ssl=1",
            title: 'Angular 2 Development',
          ),
          SizedBox(
            width: 15.0,
          ),
          BookCard(
            thumbnail:
                "https://i0.wp.com/www.programmer-books.com/wp-content/uploads/2019/04/Concurrency-in-Go.jpg?w=381&ssl=1",
            title: 'Concurrency in Go',
          ),
          SizedBox(
            width: 15.0,
          ),
        ],
      ),
    );
  }
}
