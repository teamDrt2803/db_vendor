import 'package:db_vendor/controllers/auth.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:db_vendor/helpers/default_button.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final AuthController _authController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
            keyboardType: TextInputType.phone,
            enablePinAutofill: true,
            controller: _authController.otp,
            appContext: context,
            length: 6,
            onCompleted: (s) async {
              await _authController.verifyOtp(context);
            },
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderWidth: 1,
              borderRadius: BorderRadius.circular(15),
              activeColor: kPrimaryColor,
              selectedColor: kPrimaryColor,
              inactiveColor: Colors.grey.shade400,
            ),
            onChanged: (String value) {
              print(value);
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Obx(
            () => DefaultButton(
              widget: _authController.processing
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                          Colors.white,
                        ),
                      ),
                    )
                  : null,
              text: 'Continue',
              press: () async {
                if (_authController.otp.text.length == 6) {
                  await _authController.verifyOtp(context);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
