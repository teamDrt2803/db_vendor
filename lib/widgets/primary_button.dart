import 'package:db_vendor/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loader.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key key, this.text, this.onPressed, this.showLoader = false})
      : super(key: key);
  final String text;
  final Function() onPressed;
  final bool showLoader;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(kPrimaryLightColor.withOpacity(0.7)),
        elevation: MaterialStateProperty.all(0),
        foregroundColor: MaterialStateProperty.all(kPrimaryColor),
        textStyle: MaterialStateProperty.all(Get.textTheme.subtitle1
            ?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        minimumSize: MaterialStateProperty.all(Size(Get.width * 0.8, 60)),
      ),
      child: showLoader ? Loader() : Text(text),
    );
  }
}
