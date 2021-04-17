import 'package:db_vendor/Authorization/controllers/authcontroller.dart';
import 'package:db_vendor/Authorization/views/detailsform.dart';
import 'package:db_vendor/home.dart';
import 'package:db_vendor/ui/screens/complete_profile/complete_profile_screen.dart';
import 'package:db_vendor/ui/screens/complete_profile/components/complete_profile_form.dart';
import 'package:db_vendor/ui/screens/home/home_screen.dart';
import 'package:db_vendor/ui/screens/sign_in/sign_in_screen.dart';
import 'package:db_vendor/ui/screens/splash/splash_screen.dart';
import 'package:db_vendor/ui/screens/splashScreen.dart';
import 'package:db_vendor/ui/size_config.dart';

import 'package:db_vendor/welcomscreen.dart';
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
  AuthController _authController = Get.find<AuthController>();
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
      child: StreamBuilder<User>(
        stream: _authController.user,
        builder: (context, snapshot) {
          return Obx(
            () => _authController.firstBoot.value
                ? SplashScreen()
                : snapshot.data == null
                    ? HomeScreen()
                    : _authController.setupComplete.value
                        ? HomeScreen()
                        : CompleteProfileScreen(),
          );
        },
      ),
    );
  }
}
