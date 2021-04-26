import 'package:db_vendor/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class AddressScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  CartController _cartController = Get.find();
  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Body(onPressed: onPressed);
  }
}
