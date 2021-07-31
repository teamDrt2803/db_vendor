import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/helpers/custappbar.dart';
import 'package:db_vendor/views/about.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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
      appBar: CustAppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          getTitle(),
          style: TextStyle(),
        ),
      ),
      body: widget.pageshow == PAGESHOW.ABOUT
          ? About()
          : SizedBox(
              height: double.infinity,
              width: double.infinity,
              // child: SfPdfViewer.asset(
              //   getAssets(),
              //   searchTextHighlightColor: kPrimaryLightColor,
              // ),
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
