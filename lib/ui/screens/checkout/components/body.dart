import 'package:db_vendor/ui/constants.dart';
import 'package:db_vendor/ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.25,
          width: double.infinity,
          child: Container(
            color: kPrimaryColor,
            child: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Checkout',
                      style: GoogleFonts.openSans(
                          fontSize: getProportionateScreenWidth(
                            40,
                          ),
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1),
                    ),
                  ),
                  Positioned(
                    bottom: -10.0,
                    left: 0.0,
                    right: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: Card(
                        child: Column(
                          children: [
                            Text(''),
                            Text(''),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
            child: Container(
          color: Color(
            0xfff5f6f9,
          ),
        )),
      ],
    );
  }
}
