import 'package:db_vendor/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Docs extends StatefulWidget {
  final PAGESHOW pageshow;
  const Docs({Key key, this.pageshow}) : super(key: key);

  @override
  _DocsState createState() => _DocsState();
}

class _DocsState extends State<Docs> {
  String getAssets() {
    switch (widget.pageshow) {
      case PAGESHOW.POLICY:
        return 'assets/docs/Policy.pdf';
        break;
      case PAGESHOW.ABOUT:
        return 'assets/docs/About.pdf';
      case PAGESHOW.TERMS:
        return 'assets/docs/Terms.pdf';
      default:
        return 'assets/docs/Faq.pdf';
    }
  }

  String getTitle() {
    switch (widget.pageshow) {
      case PAGESHOW.POLICY:
        return 'Privacy Policy';
        break;
      case PAGESHOW.ABOUT:
        return 'About Us';
      case PAGESHOW.TERMS:
        return 'Terms & Conditions';
      default:
        return 'FAQ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          getTitle(),
          style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        child: SfPdfViewer.asset(getAssets()),
      ),
    );
  }
}

enum PAGESHOW {
  TERMS,
  ABOUT,
  FAQ,
  POLICY,
}
