import 'package:ebookApp/Components/bookCardNav.dart';
import 'package:ebookApp/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ebookApp/Components/searchBar.dart';
import 'package:ebookApp/Components/tabBar.dart';
import 'icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    MyFlutterApp.noun_mobile_menu_345384,
                    size: 40.0,
                  ),
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                        "https://c.pxhere.com/photos/01/99/adult_beard_black_and_white_denim_jacket_facial_expression_facial_hair_fashion_fine_looking-1501223.jpg!d"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                'Hey Geek',
                style: kWelcomeStyle,
                textAlign: TextAlign.left,
              ),
            ),
            SearchBar(),
            TabNavigationBar(tabController: tabController),
            BookCardsNav(),
            BookList(),
          ],
        ),
      ),
    );
  }
}

class BookList extends StatelessWidget {
  const BookList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 100.0,
          padding: const EdgeInsets.only(left: 30.0, bottom: 10.0),
          child: Divider(
            color: Colors.black,
            height: 20.0,
            thickness: 5.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            'Top Books',
            style: kHeadingStyle,
            textAlign: TextAlign.left,
          ),
        ),
        BookListItem(),
        BookListItem(),
        BookListItem(),
        BookListItem(),
      ],
    );
  }
}

class BookListItem extends StatelessWidget {
  const BookListItem({
    Key key,
  }) : super(key: key);

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
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SvgPicture.asset(
                'images/001-reading-book.svg',
                width: 40.0,
              ),
            ),
            Expanded(
              child: Text(
                'Build Your Own PaaS with Docker and Docker',
                softWrap: true,
                style: kBookListNameStyle,
                // overflow: TextOverflow.fade,
              ),
            ),
            MaterialButton(
              minWidth: 50.0,
              height: 50.0,
              child: Icon(
                Icons.ac_unit,
                size: 30.0,
                color: Colors.grey,
              ),
              onPressed: () {},
            )
          ]),
    );
  }
}
