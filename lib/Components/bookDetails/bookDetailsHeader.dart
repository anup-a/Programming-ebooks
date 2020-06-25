import 'package:flutter/material.dart';

class BookDetailsHeader extends StatelessWidget {
  const BookDetailsHeader({this.thumbnail});
  final thumbnail;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        padding: EdgeInsets.symmetric(
          horizontal: 120.0,
          vertical: 50.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40.0),
          ),
          color: Colors.black.withOpacity(0.10),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 15.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                )
              ],
              image: DecorationImage(
                  image: NetworkImage(thumbnail), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
