import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(height: 25),
        Text(
          heading,
          textAlign: TextAlign.center,
          style: Get.textTheme.headline3?.copyWith(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.7,
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(text,
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyText2?.copyWith(letterSpacing: 0.7)),
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            image,
            height: (250),
            width: (250),
          ),
        ),
      ],
    );
  }
}
