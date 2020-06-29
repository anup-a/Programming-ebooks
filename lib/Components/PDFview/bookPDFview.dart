import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:ebookApp/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsPDFview extends StatefulWidget {
  BookDetailsPDFview(
      {Key key,
      this.pdfLink,
      @required this.title,
      this.downloaded = false,
      this.pdfPath})
      : super(key: key);
  final pdfLink;
  final title;
  final downloaded;
  final pdfPath;

  @override
  _BookDetailsPDFviewState createState() => _BookDetailsPDFviewState();
}

class _BookDetailsPDFviewState extends State<BookDetailsPDFview> {
  bool _isLoading = true;
  PDFDocument document;
  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = widget.downloaded
        ? await PDFDocument.fromLocalAsset(this.widget.pdfPath)
        : await PDFDocument.fromURL(this.widget.pdfLink);
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomPDFAppBar(
        bookTitle: this.widget.title,
      ),
      body: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(
                document: document,
                zoomSteps: 1,
                showPicker: true,
                navigationBuilder:
                    (context, page, totalPages, jumpToPage, animateToPage) {
                  return ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.first_page),
                        onPressed: () {
                          jumpToPage(page: 0);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          animateToPage(page: page - 2);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          animateToPage(page: page);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.last_page),
                        onPressed: () {
                          jumpToPage(page: totalPages - 1);
                        },
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}

class CustomPDFAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 100.0;
  const CustomPDFAppBar({
    Key key,
    @required this.bookTitle,
  }) : super(key: key);

  final bookTitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: kBoxShadowStyle,
        ),
        padding: EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
          right: 10.0,
        ),
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15.0,
              ),
            ),
            Expanded(
              child: Text(
                bookTitle.toUpperCase(),
                style: kBookTitleStyle,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}
