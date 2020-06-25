import 'package:ebookApp/styles.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 50.0,
            margin: EdgeInsets.only(
                left: 20.0, right: 10.0, top: 20.0, bottom: 20.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: kHintStyle,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(15.0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 60.0,
          margin: EdgeInsets.only(right: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.black.withOpacity(0.05),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.sort,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
