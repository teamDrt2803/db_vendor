import 'package:db_vendor/helpers/constants.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class CheckoutScreen extends StatelessWidget {
  final double total;

  const CheckoutScreen({Key key, @required this.total}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
      ),
      body: Body(
        total: total,
      ),
    );
  }
}
