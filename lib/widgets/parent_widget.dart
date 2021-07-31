import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'primary_button.dart';

class ParentWidget extends StatelessWidget {
  const ParentWidget(
      {Key key,
      @required this.child,
      @required this.systemColor,
      @required this.brightness,
      this.bottomSheet,
      this.padding = EdgeInsets.zero})
      : super(key: key);

  ///Creates a constructor for a [ParentWidget] with [systemColor] as [Colors.white] and default brightness as [Brightness.dark]
  ParentWidget.white({
    Key key,
    @required this.child,
    this.bottomSheet,
    this.padding = EdgeInsets.zero,
  })  : systemColor = Colors.white,
        brightness = Brightness.dark,
        super(key: key);
  ParentWidget.button({
    Key key,
    @required this.child,
    Function() onPressed,
    String title,
    this.padding = EdgeInsets.zero,
    this.systemColor = Colors.white,
    this.brightness = Brightness.dark,
  })  : bottomSheet = Container(
            height: 120,
            color: Colors.white,
            child: Center(
                child: PrimaryButton(text: title, onPressed: onPressed))),
        super(key: key);

  ///Child widget
  final Widget child;

  ///[Color] for the status bar and navigationbar
  final Color systemColor;
  final Brightness brightness;
  final EdgeInsetsGeometry padding;
  final Widget bottomSheet;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: systemColor,
        statusBarIconBrightness: brightness,
        systemNavigationBarColor: systemColor,
      ),
      child: Scaffold(
        body: Padding(padding: padding, child: child),
        bottomSheet: bottomSheet,
      ),
    );
  }
}
