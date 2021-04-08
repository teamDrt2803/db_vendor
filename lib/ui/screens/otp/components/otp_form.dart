import 'package:db_vendor/Authorization/controllers/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:db_vendor/ui/components/default_button.dart';
import 'package:db_vendor/ui/size_config.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../constants.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  AuthController _authController = Get.find();
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          PinCodeTextField(
            keyboardType: TextInputType.visiblePassword,
            enablePinAutofill: true,
            //enableActiveFill: true,
            controller: _textEditingController,
            appContext: context,
            length: 6,
            onChanged: (s) {
              _authController.updateOtp(
                otp1: s,
              );
            },
            onCompleted: (s) async {
              _authController.updateOtp(
                otp1: s,
              );
              if (s.length == 6) {
                await _authController.verifyOtp(
                  otp: _authController.otp.value,
                );
                Get.back(
                  closeOverlays: true,
                );
              }
            },
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderWidth: 1,
              borderRadius: BorderRadius.circular(15),
              activeColor: kPrimaryColor,
              selectedColor: kPrimaryColor,
              inactiveColor: Colors.grey.shade400,
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () {},
          )
        ],
      ),
    );
  }
}
