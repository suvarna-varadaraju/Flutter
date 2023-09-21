import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'Colours.dart';

class PDFViwer extends StatefulWidget {
  String pdfUrl;
  String projectType;
  PDFViwer({required this.pdfUrl,required this.projectType});

  @override
  State<PDFViwer> createState() => _VideoPlayerScreenState(pdfUrl,projectType);
}

class _VideoPlayerScreenState extends State<PDFViwer> {
  final String pdfUrl;
  final String projectType;
  bool isListViewOpen = false;
  _VideoPlayerScreenState(this.pdfUrl,this.projectType);

  void initState() {
    super.initState();
    print('pdfUrl email: $pdfUrl');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: ColorConstants.kPrimaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          getTitleBasedOnString(projectType),
          style: TextStyle(
            color: ColorConstants.kPrimaryColor,
            fontFamily: 'Montserrat',
            fontSize: 24,
            fontWeight: FontWeight.bold, // Font weight
          ),
        ),
        centerTitle: true, // Center the title horizontally
        backgroundColor: Colors.white, // Center-aligned text
        actions: [
          IconButton(
            icon: Icon(Icons.download,color: ColorConstants.kPrimaryColor), // Right-side image icon
            onPressed: () {
              // Handle the right-side image button press here
              // Example: Open a menu or perform an action
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
          pdfUrl,
          //initialScrollOffset: Offset(0, 500),
          //initialZoomLevel: 2,
          pageSpacing: 3,
          //canShowScrollHead: true,
          //canShowScrollStatus: true,
          //canShowPaginationDialog: true,
          //canShowPageLoadingIndicator: false,
        onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
          showErrorDialog(context, details.error, details.description);
        },
      ),
    );
  }

  void showErrorDialog(BuildContext context, String error, String description) {
    showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(error),
            content: Text(description),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  String getTitleBasedOnString(String myString) {
    if (myString == "searenity") {
      return "Villas";
    } else if (myString == "amara") {
      return "Villas";
    } else if (myString == "sunrays") {
      return "Villas";
    } else if (myString == "serene") {
      return "Villas";
    } else if (myString == "azalea") {
      return "Villas";
    } else {
      return "Residential"; // You can provide a default title for other cases
    }
  }

}

