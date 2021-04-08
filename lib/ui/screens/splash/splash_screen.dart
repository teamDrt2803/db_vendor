import 'package:flutter/material.dart';
import 'package:db_vendor/ui/screens/splash/components/body.dart';
import 'package:db_vendor/ui/size_config.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        //statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
