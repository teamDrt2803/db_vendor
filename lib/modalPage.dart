import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalPage extends StatelessWidget {
  final Widget footer, body;
  final String title;

  const ModalPage(
      {Key key, @required this.footer, @required this.body, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Color(0xff5b92ac),
        body: Stack(
          children: [
            Container(
              color: Color(0xff5b92ac),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 16.0,
                  ),
                  child: footer ?? SizedBox.shrink(),
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.all(8),
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height * 0.80,
                  width: double.infinity,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Color(
                                0xff212223,
                              ),
                            ),
                            onPressed: () {
                              Get.back(closeOverlays: true);
                            },
                            iconSize: 16.0,
                            tooltip: 'Go Back',
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(title ?? '',
                                textScaleFactor: 1.2,
                                style: GoogleFonts.openSans(
                                  color: Color(0xff212223),
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.1,
                                )),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          body ?? SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
