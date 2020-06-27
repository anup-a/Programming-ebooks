import 'package:flutter/material.dart';

List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

List<Map> categories = [
  {'name': 'Cats', 'iconPath': 'images/cat.png'},
  {'name': 'Dogs', 'iconPath': 'images/dog.png'},
  {'name': 'Bunnies', 'iconPath': 'images/rabbit.png'},
  {'name': 'Parrots', 'iconPath': 'images/parrot.png'},
  {'name': 'Horses', 'iconPath': 'images/horse.png'}
];

List<Map> drawerItems = [
  {'icon': Icons.mail, 'title': 'Home', 'isActive': true},
  {'icon': Icons.favorite, 'title': 'Bookmarks', 'isActive': false},
  {'icon': Icons.mail, 'title': 'Downloads', 'isActive': false},
  {'icon': Icons.mail, 'title': 'About Me', 'isActive': false},
];
