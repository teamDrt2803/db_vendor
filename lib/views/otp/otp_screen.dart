import 'package:flutter/material.dart';

import 'package:db_vendor/controllers/auth.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class OtpScreen extends StatefulWidget {
  static String routeName = '/otp';

  const OtpScreen({Key key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final AuthController authController = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Body(
        phone: authController.phone.text,
      ),
    );
  }
}
