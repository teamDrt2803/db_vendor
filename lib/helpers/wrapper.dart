import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/views/mainscreen/mainscreen.dart';
import 'package:db_vendor/views/views.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Wrapper extends StatefulWidget {
  static String routeName = '/wrapper';
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final AuthController _authController = Get.find<AuthController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Obx(
        () => _authController.firstBoot
            ? SplashScreen()
            : _authController.firestoreUser.value.setupComplete
                ? MainScreen()
                : CompleteProfileScreen(),
      ),
    );
  }
}
