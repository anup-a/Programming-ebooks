import 'package:ebookApp/Components/HomePage/bookCard.dart';
import 'package:ebookApp/Components/bookListItem.dart';
import 'package:ebookApp/models/book.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> rawJsonData = [
  {
    "title": "C# and XML Primer",
    "thumbnail":
        "https://i1.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/C-and-XML-Primer.jpg?resize=330%2C499&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/C-and-XML-Primer.pdf",
    "tag": "['C# Language']",
    "category": "Software Development",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "Python Unit Test Automation",
    "thumbnail":
        "https://i1.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/Python-Unit-Test-Automation-330x500.jpg?resize=330%2C500&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/Python-Unit-Test-Automation.pdf",
    "tag": "['Python Language']",
    "category": "Software Development",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "Beginning C# 2008 Objects",
    "thumbnail":
        "https://i2.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/Beginning-C-2008-Objects.jpg?resize=378%2C499&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/Beginning-C-2008-Objects.pdf",
    "tag": "['C# Language']",
    "category": "Software Development",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "Learning Concurrent Programming in Scala, 2nd Edition",
    "thumbnail":
        "https://i1.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/Learning-Concurrent-Programming-in-Scala-2nd-Edition-400x475.jpg?resize=400%2C475&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/Learning-Concurrent-Programming-in-Scala-2nd-Edition.pdf",
    "tag": "[]",
    "category": "",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "Data Visualisation with R",
    "thumbnail":
        "https://i2.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/Data-Visualisation-with-R.jpg?resize=332%2C499&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/Data-Visualisation-with-R.pdf",
    "tag": "['Data Science Books', 'Software Development', 'R Language']",
    "category": "Artificial Intelligence Books",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "Essentials of Computer Architecture, 2nd Edition",
    "thumbnail":
        "https://i2.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/Essentials-of-Computer-Architecture-2nd-Edition.jpg?resize=387%2C499&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/Essentials-of-Computer-Architecture-2nd-Edition.pdf",
    "tag": "['System Administrations']",
    "category": "Software Development",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "Handbook of Big Data Technologies",
    "thumbnail":
        "https://i0.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/Handbook-of-Big-Data-Technologies.jpg?resize=315%2C499&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/Handbook-of-Big-Data-Technologies.pdf",
    "tag": "['System Administrations']",
    "category": "Software Development",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "UNIX for Programmers and Users, 3rd Edition",
    "thumbnail":
        "https://i0.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/UNIX-for-Programmers-and-Users-3rd-Edition.jpg?resize=379%2C499&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/UNIX-for-Programmers-and-Users-3rd-Edition.pdf",
    "tag": "['Linux Books', 'Software Development']",
    "category": "System Administrations",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "PostgreSQL Development Essentials",
    "thumbnail":
        "https://i1.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/PostgreSQL-Development-Essentials-400x493.jpg?resize=400%2C493&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/PostgreSQL-Development-Essentials.pdf",
    "tag": "['System Administrations']",
    "category": "Software Development",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "Mastering IPython 4.0",
    "thumbnail":
        "https://i0.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/Mastering-IPython-4-400x475.jpg?resize=400%2C475&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/Mastering-IPython-4.0.pdf",
    "tag": "['Python Language']",
    "category": "Software Development",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "Django Project Blueprints",
    "thumbnail":
        "https://i0.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/Django-Project-Blueprints-400x493.jpg?resize=400%2C493&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/Django-Project-Blueprints.pdf",
    "tag": "['Python Language', 'Web development']",
    "category": "Software Development",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "QGIS Python Programming Cookbook",
    "thumbnail":
        "https://i2.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/QGIS-Python-Programming-Cookbook-400x493.jpg?resize=400%2C493&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/QGIS-Python-Programming-Cookbook.pdf",
    "tag": "['Python Language']",
    "category": "Software Development",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "Beginning Data Science in R",
    "thumbnail":
        "https://i0.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/Beginning-Data-Science-in-R.jpg?resize=350%2C499&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/Beginning-Data-Science-in-R.pdf",
    "tag": "['Software Development', 'R Language']",
    "category": "Data Science Books",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "Building Tools with GitHub",
    "thumbnail":
        "https://i2.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/Building-Tools-with-GitHub.jpg?resize=381%2C499&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/Building-Tools-with-GitHub.pdf",
    "tag": "['Github Books', 'Random Books', 'Software Development']",
    "category": "Web development",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "Xamarin Studio for Android Programming: A C# Cookbook",
    "thumbnail":
        "https://i2.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/Xamarin-Studio-for-Android-Programming-400x493.jpg?resize=400%2C493&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/Xamarin-Studio-for-Android-Programming.pdf",
    "tag": "['Android', 'Software Development', 'C# Language']",
    "category": "Mobile Development",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "Java All-In-One Desk Reference For Dummies",
    "thumbnail":
        "https://i1.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/Java-All-In-One-Desk-Reference-For-Dummies1-400x500.jpg?resize=400%2C500&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/Java-All-In-One-Desk-Reference-For-Dummies.pdf",
    "tag": "['Java Language']",
    "category": "Software Development",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "Java EE 7 Developer Handbook",
    "thumbnail":
        "https://i2.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/Java-EE-7-Developer-Handbook-400x493.jpg?resize=400%2C493&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/Java-EE-7-Developer-Handbook.pdf",
    "tag": "['Java Language']",
    "category": "Software Development",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "Java SOA Cookbook",
    "thumbnail":
        "https://i1.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/Java-SOA-Cookbook.jpg?resize=379%2C499&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/Java-SOA-Cookbook.pdf",
    "tag": "['Java Language']",
    "category": "Software Development",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "Java EE 7 Development with NetBeans 8",
    "thumbnail":
        "https://i1.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/Java-EE-7-Development-with-NetBeans-8-400x493.jpg?resize=400%2C493&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/Java-EE-7-Development-with-NetBeans-8.pdf",
    "tag": "['Java Language']",
    "category": "Software Development",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "Programming Interactivity",
    "thumbnail":
        "https://i0.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/Programming-Interactivity.jpg?resize=381%2C499&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/Programming-Interactivity.pdf",
    "tag": "['Web development']",
    "category": "Software Development",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "Regular Expression Recipes for Windows Developers",
    "thumbnail":
        "https://i0.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/Regular-Expression-Recipes-for-Windows-Developers.jpg?resize=378%2C499&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/Regular-Expression-Recipes-for-Windows-Developers.pdf",
    "tag": "['C# Language']",
    "category": "Software Development",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  },
  {
    "title": "Pro Python Best Practices",
    "thumbnail":
        "https://i1.wp.com/www.programmer-books.com/wp-content/uploads/2019/05/Pro-Python-Best-Practices.jpg?resize=351%2C499&ssl=1",
    "pdfLink":
        "https://www.programmer-books.com/wp-content/uploads/2019/05/Pro-Python-Best-Practices.pdf",
    "tag": "['Python Language']",
    "category": "Software Development",
    "pdfPath": "",
    "description": "",
    "isBookmarked": "false",
    "isDownloaded": "false",
  }
];

List<BookListItem> getObjectFromJSON() {
  List<BookListItem> generateBookObjects = [];
  for (var book in rawJsonData) {
    Book newbook = Book.fromJson(book);
    generateBookObjects.add(
      BookListItem(
        book: newbook,
      ),
    );
  }
  return generateBookObjects;
}

List<Widget> getBookCardsfromJSON() {
  List<Widget> generateBookObjects = [];
  for (var book in rawJsonData) {
    Book newbook = Book.fromJson(book);
    generateBookObjects.add(
      BookCard(
        book: newbook,
      ),
    );
    generateBookObjects.add(
      SizedBox(
        width: 15.0,
      ),
    );
  }
  return generateBookObjects.sublist(10);
}

List<BookListItem> allBooksList = getObjectFromJSON();
List<Widget> allBookCards = getBookCardsfromJSON();
