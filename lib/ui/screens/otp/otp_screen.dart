import 'package:db_vendor/Authorization/controllers/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:db_vendor/ui/size_config.dart';

import 'components/body.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  static String routeName = "/otp";
  final AuthController authController;

  const OtpScreen({Key key, this.phone, this.authController}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Body(
        phone: widget.phone,
      ),
    );
  }
}
