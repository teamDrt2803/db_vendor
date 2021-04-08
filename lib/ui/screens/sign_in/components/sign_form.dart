import 'package:db_vendor/Authorization/controllers/authcontroller.dart';
import 'package:db_vendor/ui/screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:db_vendor/ui/components/custom_surfix_icon.dart';
import 'package:db_vendor/ui/components/form_error.dart';
import 'package:db_vendor/ui/helper/keyboard.dart';
import 'package:db_vendor/ui/screens/forgot_password/forgot_password_screen.dart';
import 'package:db_vendor/ui/screens/login_success/login_success_screen.dart';
import 'package:get/get.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  final AuthController authController = Get.find();

  SignForm({Key key}) : super(key: key);
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Terms \& Conditions"),
              Spacer(),
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          Obx(
            () => DefaultButton(
              widget:
                  widget.authController.status.value == SignInStatus.PROCESSING
                      ? Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                              Colors.white,
                            ),
                          ),
                        )
                      : null,
              text: "Continue",
              press: () async {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  // if all are valid then go to success screen
                  KeyboardUtil.hideKeyboard(context);
                  await widget.authController.sendOtp(
                    phoneNumber: widget.authController.number.value,
                  );
                  // Get.to(() => OtpScreen(
                  //       phone: email,
                  //     ));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        widget.authController.updateNumber(number1: value);
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (value.length == 10) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (value.length != 10) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      maxLength: 10,
      decoration: InputDecoration(
        labelText: "Phone",
        hintText: "Enter your Phone Number",
        prefixText: '+91',
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/callcopy.svg"),
      ),
    );
  }
}
