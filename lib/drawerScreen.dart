import 'package:ebookApp/bookmarkList.dart';
import 'package:ebookApp/configuration.dart';
import 'package:ebookApp/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.only(top: 50, bottom: 20, left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Programming Ebooks',
                    style: kHeadingStyle.copyWith(
                      color: Colors.white.withOpacity(0.65),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  DecorationLine(
                    color: Colors.white.withOpacity(0.65),
                    leftPadding: 0.0,
                    width: 70.0,
                  )
                ],
              )
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: drawerItems
                  .map((element) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => element['nextPage'],
                              ),
                            );
                          },
                          child: Stack(
                            overflow: Overflow.visible,
                            children: [
                              Text(
                                element['title'],
                                style: element['isActive']
                                    ? kDrawerActiveTextStyle
                                    : kDrawerTextStyle,
                              ),
                              Positioned(
                                top: 14.0,
                                child: DecorationLine(
                                  leftPadding: 0.0,
                                  color: Colors.white.withOpacity(0.25),
                                  width: 70.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      AntDesign.github,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      AntDesign.mail,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  'anup.tech',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.75),
                    fontSize: 20.0,
                    fontFamily: 'ProductSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
