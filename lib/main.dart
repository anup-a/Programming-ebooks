import 'package:ebookApp/Components/bookCardNav.dart';
import 'package:ebookApp/Components/booksList.dart';
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
