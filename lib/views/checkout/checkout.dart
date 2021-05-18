import 'package:db_vendor/helpers/custappbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class CheckoutScreen extends StatelessWidget {
  final double total;

  const CheckoutScreen({Key key, @required this.total}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kPrimaryColor,
      extendBodyBehindAppBar: true,
      appBar: CustAppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            }),
        title: Text('Order complete'),
      ),
      body: Body(),
    );
  }
}
