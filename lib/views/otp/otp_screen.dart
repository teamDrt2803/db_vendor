import 'package:db_vendor/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:db_vendor/modals/size_config.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Body(
        phone: widget.phone ?? widget.authController.number.value,
      ),
    );
  }
}
