import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:ebookApp/Components/PDFview/bookPDFview.dart';
import 'package:ebookApp/styles.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class BookDetailsBottomButtons extends StatefulWidget {
  const BookDetailsBottomButtons({this.pdfLink, this.title});
  final pdfLink;
  final title;

  @override
  _BookDetailsBottomButtonsState createState() =>
      _BookDetailsBottomButtonsState();
}

class _BookDetailsBottomButtonsState extends State<BookDetailsBottomButtons> {
  bool isDownloading = false;
  bool downloadedFile = false;

  String progressString = "";
  double progressValue = 0.0;

  String getIdfromLink(String url) {
    return url.split("/").lastWhere(isEmpty);
  }

  bool isEmpty(String element) {
    if (element.length == 0) {
      return false;
    }
    return true;
  }

  Future<void> downloadFile() async {
    setState(() {
      isDownloading = true;
    });
    Dio dio = Dio();
    try {
      var dir = await getApplicationDocumentsDirectory();

      await dio.download(
          widget.pdfLink, "${dir.path}/${getIdfromLink(widget.pdfLink)}",
          onReceiveProgress: (rec, total) {
        print("Rec: $rec , Total: $total");

        setState(() {
          progressValue = (rec / total);
          progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
        });
      });
    } catch (e) {
      print(e);
    }

    setState(() {
      isDownloading = false;
      progressString = "Completed";
      downloadedFile = true;
    });
    print("Download completed");
  }

  Future<void> viewFile() async {
    var dir = await getApplicationDocumentsDirectory();
    var filePath = "${dir.path}/${getIdfromLink(widget.pdfLink)}";
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailsPDFview(
          title: widget.title,
          pdfPath: filePath,
          downloaded: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          // color: Color(0XFFE5E5E5),
          color: Colors.white,
          // border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 15.0, // soften the shadow
              spreadRadius: 2.0, //extend the shadow
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailsPDFview(
                      pdfLink: widget.pdfLink,
                      title: widget.title,
                    ),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.bookmark_border),
                  SizedBox(height: 2.0),
                  Text('Read Book', style: kBottomNavItemStyle)
                ],
              ),
            ),
            DownloaderButton(
              fileDownloaded: downloadedFile,
              isDownloading: isDownloading,
              viewFile: viewFile,
              downloadFile: downloadFile,
              progressString: progressString,
              progressValue: progressValue,
            ),
            Column(
              children: <Widget>[
                Icon(Icons.share),
                SizedBox(height: 2.0),
                Text('Share Link', style: kBottomNavItemStyle)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DownloaderButton extends StatelessWidget {
  DownloaderButton(
      {this.fileDownloaded,
      this.isDownloading,
      this.viewFile,
      this.progressString,
      this.downloadFile,
      this.progressValue});
  final bool fileDownloaded;
  final bool isDownloading;
  final String progressString;
  final Function viewFile;
  final Function downloadFile;
  final double progressValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fileDownloaded ? viewFile : downloadFile,
      child: fileDownloaded
          ? Column(
              children: <Widget>[
                Icon(Icons.view_headline),
                SizedBox(height: 2.0),
                Text('View File', style: kBottomNavItemStyle)
              ],
            )
          : isDownloading
              ? Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black,
                        value: progressValue,
                        strokeWidth: 3.0,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                    Text(progressString),
                  ],
                )
              : Column(
                  children: <Widget>[
                    Icon(Icons.file_download),
                    SizedBox(height: 2.0),
                    Text('Download', style: kBottomNavItemStyle)
                  ],
                ),
    );
  }
}
