import 'package:ebookApp/Components/HomePage/bookCardNav.dart';
import 'package:ebookApp/Components/booksList.dart';
import 'package:ebookApp/db/allBooks.dart';
import 'package:ebookApp/drawerScreen.dart';
import 'package:ebookApp/styles.dart';
import 'package:flutter/material.dart';
import 'package:ebookApp/Components/searchBar.dart';
import 'package:ebookApp/Components/tabBar.dart';
import 'icons.dart';

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

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1.0;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            DrawerScreen(),
            AnimatedContainer(
              transform: Matrix4.translationValues(xOffset, yOffset, 0)
                ..scale(scaleFactor)
                ..rotateY(isDrawerOpen ? -0.5 : 0),
              duration: Duration(milliseconds: 250),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
                boxShadow: kBoxShadowWidgetStyle,
              ),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        isDrawerOpen
                            ? IconButton(
                                icon: Icon(Icons.arrow_back_ios),
                                onPressed: () {
                                  setState(() {
                                    xOffset = 0;
                                    yOffset = 0;
                                    scaleFactor = 1;
                                    isDrawerOpen = false;
                                  });
                                },
                              )
                            : IconButton(
                                icon: Icon(
                                  MyFlutterApp.noun_mobile_menu_345384,
                                  size: 35.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    xOffset = 230;
                                    yOffset = 150;
                                    scaleFactor = 0.6;
                                    isDrawerOpen = true;
                                  });
                                },
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
                  BookList(
                    booksList: allBooksList,
                    listTitle: "All Books",
                    showAllBooksButton: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
