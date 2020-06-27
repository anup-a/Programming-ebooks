import 'package:ebookApp/Components/bookListItem.dart';
import 'package:ebookApp/styles.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  const BookList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DecorationLine(),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Top Books',
                style: kHeadingStyle,
                textAlign: TextAlign.left,
              ),
              MaterialButton(
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Text(
                      'All Books',
                      style: kCardBookStyle.copyWith(
                        color: Colors.grey,
                        fontSize: 20.0,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        BookListItem(
          thumbnail:
              'https://i1.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/C-and-XML-Primer.jpg?w=330&ssl=1',
          title: 'Build Your Own PaaS with Docker and Docker',
          category: 'Software Dev',
          pdfLink:
              "https://www.programmer-books.com/wp-content/uploads/2019/05/C-and-XML-Primer.pdf",
        ),
        BookListItem(
          thumbnail:
              'https://i1.wp.com/www.programmer-books.com/wp-content/uploads/2020/06/99557a9d3f76650.jpg?resize=200%2C243&ssl=1',
          title: 'Microsoft SharePoint 2013 Administration Inside Out',
          category: 'Random',
          pdfLink:
              "https://www.programmer-books.com/wp-content/uploads/2019/05/C-and-XML-Primer.pdf",
        ),
        BookListItem(
          thumbnail:
              'https://i2.wp.com/www.programmer-books.com/wp-content/uploads/2020/06/Articulate-Storyline-Essentials1-400x493-1.jpg?w=400&ssl=1',
          title: 'Articulate Storyline Essentials',
          category: 'Software Dev',
          pdfLink:
              "https://www.programmer-books.com/wp-content/uploads/2018/09/jQueryUI_CH01.pdf",
        ),
        BookListItem(
          thumbnail:
              'https://i1.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/C-and-XML-Primer.jpg?w=330&ssl=1',
          title: 'Build Your Own PaaS with Docker and Docker',
          category: 'Software Dev',
          pdfLink:
              "https://www.programmer-books.com/wp-content/uploads/2018/09/jQueryUI_CH01.pdf",
        ),
        BookListItem(
          thumbnail:
              'https://i2.wp.com/www.programmer-books.com/wp-content/uploads/2018/08/datastructure.png?w=468&ssl=1',
          title: 'Data Structures and Program Design Using C',
          category: 'Software Dev',
          pdfLink:
              "https://www.programmer-books.com/wp-content/uploads/2018/09/jQueryUI_CH01.pdf",
        ),
        BookListItem(
          thumbnail:
              'https://i2.wp.com/www.programmer-books.com/wp-content/uploads/2018/08/datastructure.png?w=468&ssl=1',
          title: 'Data Structures and Program Design Using C',
          category: 'Software Dev',
          pdfLink:
              "https://www.programmer-books.com/wp-content/uploads/2018/09/jQueryUI_CH01.pdf  ",
        ),
      ],
    );
  }
}
