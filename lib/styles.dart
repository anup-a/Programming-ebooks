import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle kWelcomeStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'ProductSans',
  fontWeight: FontWeight.bold,
);

TextStyle kTabStyle = TextStyle(
  fontSize: 17.0,
  fontFamily: 'ProductSans',
  fontWeight: FontWeight.bold,
);

TextStyle kHintStyle = TextStyle(
  letterSpacing: 1.0,
  fontFamily: 'ProductSans',
);

TextStyle kCardBookStyle = TextStyle(
  fontSize: 17.0,
  fontFamily: 'ProductSans',
  fontWeight: FontWeight.bold,
);

TextStyle kHeadingStyle = TextStyle(
  fontSize: 25.0,
  fontFamily: 'ProductSans',
  fontWeight: FontWeight.w900,
);

TextStyle kBookListNameStyle = TextStyle(
  fontSize: 17.0,
  fontFamily: 'ProductSans',
  fontWeight: FontWeight.bold,
);

TextStyle kBookListCaetgoryStyle = TextStyle(
  fontSize: 15.0,
  fontFamily: 'ProductSans',
  fontWeight: FontWeight.bold,
  color: Colors.grey,
  letterSpacing: 1.0,
);

TextStyle kTagStyle = TextStyle(
  fontSize: 11.0,
  fontFamily: 'ProductSans',
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

TextStyle kBottomNavItemStyle = TextStyle(
  fontSize: 12.0,
  fontFamily: 'ProductSans',
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

TextStyle kBookDescriptionStyle = TextStyle(
  fontSize: 14.0,
  fontFamily: 'ProductSans',
  fontWeight: FontWeight.normal,
  color: Colors.grey,
);

TextStyle kBookTitleStyle = TextStyle(
  fontSize: 16.0,
  fontFamily: 'ProductSans',
  fontWeight: FontWeight.bold,
  color: Colors.white,
  letterSpacing: 2.0,
);

TextStyle kDrawerTextStyle = TextStyle(
  fontSize: 22.0,
  fontFamily: 'ProductSans',
  fontWeight: FontWeight.bold,
  letterSpacing: 1.0,
  color: Colors.white.withOpacity(0.65),
);

TextStyle kDrawerActiveTextStyle = kDrawerTextStyle.copyWith(
  color: Colors.white,
);

List<BoxShadow> kBoxShadowStyle = [
  BoxShadow(
    color: Colors.black.withOpacity(0.25),
    blurRadius: 15.0, // soften the shadow
    spreadRadius: 5.0, //extend the shadow
  )
];

List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

List<BoxShadow> kBoxShadowWidgetStyle = [
  BoxShadow(
    color: Colors.black.withOpacity(0.25),
    blurRadius: 15.0, // soften the shadow
    spreadRadius: 10.0, //extend the shadow
  )
];

class DecorationLine extends StatelessWidget {
  const DecorationLine({
    Key key,
    this.color = Colors.black,
    this.leftPadding = 30.0,
    this.width = 100.0,
    this.height = 20.0,
  }) : super(key: key);

  final Color color;
  final double leftPadding;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.only(left: leftPadding, bottom: 10.0),
      child: Divider(
        color: color,
        height: height,
        thickness: 5.0,
      ),
    );
  }
}
