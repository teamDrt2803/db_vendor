import 'package:flutter/material.dart';

import 'constants.dart';
import '../modals/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.widget,
    this.press,
    this.color,
    this.height,
    this.width,
    this.shape,
  }) : super(key: key);
  final String text;
  final Widget widget;
  final Function press;
  final Color color;
  final double height, width;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? (56),
      // ignore: deprecated_member_use
      child: FlatButton(
        shape: shape ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: color ?? kPrimaryColor,
        onPressed: press,
        child: widget ??
            Text(
              text,
              style: TextStyle(
                fontSize: (18),
                color: color ?? Colors.white,
              ),
            ),
      ),
    );
  }
}
