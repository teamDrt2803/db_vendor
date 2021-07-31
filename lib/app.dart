import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helpers/constants.dart';
import 'helpers/initialbindings.dart';
import 'helpers/routes.dart';
import 'modals/theme.dart';
import 'views/splashScreen.dart';

class DiscountBazaar extends StatelessWidget {
  const DiscountBazaar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      debugShowCheckedModeBanner: false,
      title: Consts.app_name,
      theme: theme(),
      initialRoute: Splash.routeName,
      routes: routes,
    );
  }
}
