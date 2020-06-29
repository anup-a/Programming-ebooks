import 'dart:convert';

class Book {
  String title;
  String pdfLink;
  String thumbnail;
  String description;
  String pdfPath;

  Book({
    this.title,
    this.pdfLink,
    this.thumbnail,
    this.description,
    this.pdfPath = "",
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        title: json['title'],
        pdfLink: json['pdfLink'],
        thumbnail: json['thumbnail'],
        description: json['description']);
  }

  static Map<String, dynamic> toMap(Book book) => {
        'title': book.title,
        'pdfLink': book.pdfLink,
        'thumbnail': book.thumbnail,
        'description': book.description,
      };

  static String encodeBooks(List<Book> books) => json.encode(
        books.map<Map<String, dynamic>>((book) => Book.toMap(book)).toList(),
      );

  static List<Book> decodeBooks(String books) =>
      (json.decode(books) as List<dynamic>)
          .map<Book>((item) => Book.fromJson(item))
          .toList();
}