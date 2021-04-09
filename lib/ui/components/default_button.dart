import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.widget,
    this.press,
    this.color,
    this.height,
    this.width,
  }) : super(key: key);
  final String text;
  final Widget widget;
  final Function press;
  final Color color;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? getProportionateScreenHeight(56),
      // ignore: deprecated_member_use
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: color ?? kPrimaryColor,
        onPressed: press,
        child: widget ??
            Text(
              text,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: color == null ? Colors.white : kPrimaryColor,
              ),
            ),
      ),
    );
  }
}
