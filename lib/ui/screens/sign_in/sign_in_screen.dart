import 'package:db_vendor/Authorization/controllers/authcontroller.dart';
import 'package:db_vendor/ui/screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = "/sign_in";
  final AuthController authController;

  const SignInScreen({Key key, this.authController}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.authController.status.value == SignInStatus.OTPSENT) {
      Get.off(
        () => OtpScreen(
          authController: widget.authController,
        ),
      );
    }
    widget.authController.status.listen((status) {
      if (mounted) {
        if (status == SignInStatus.OTPSENT) {
          Get.to(
            () => OtpScreen(
              authController: widget.authController,
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Body(
        authController: widget.authController,
      ),
    );
  }
}
