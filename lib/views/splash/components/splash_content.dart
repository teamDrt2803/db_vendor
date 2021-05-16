import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
    this.heading,
  }) : super(key: key);
  final String text, image, heading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          heading,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(),
          ),
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: image == 'assets/images/splash_4.png' ||
                  image == 'assets/images/splash_2.png'
              ? getProportionateScreenHeight(300)
              : getProportionateScreenHeight(265),
          width: image == 'assets/images/splash_4.png' ||
                  image == 'assets/images/splash_2.png'
              ? getProportionateScreenHeight(300)
              : getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
