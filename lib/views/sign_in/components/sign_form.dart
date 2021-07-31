import 'package:db_vendor/controllers/auth.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/helpers/default_button.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:db_vendor/views/home/documents.dart';

import 'package:flutter/material.dart';
import 'package:db_vendor/helpers/custom_surfix_icon.dart';
import 'package:db_vendor/helpers/form_error.dart';
import 'package:db_vendor/helpers/keyboard.dart';
import 'package:get/get.dart';

class SignForm extends StatefulWidget {
  SignForm({Key key}) : super(key: key);
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final AuthController authController = Get.find();
  final _formKey = GlobalKey<FormState>();

  bool remember = true;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error)) {
      setState(() => errors.add(error));
    }
  }

  void removeError({String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: (30)),
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
              TextButton(
                  onPressed: () {
                    Get.to(() => Docs(
                          pageshow: PAGESHOW.TERMS,
                        ));
                  },
                  child: Text('Terms & Conditions')),
              Spacer(),
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: (20)),
          Obx(
            () => DefaultButton(
              widget: authController.processing
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                          Colors.white,
                        ),
                      ),
                    )
                  : null,
              text: 'Continue',
              press: remember
                  ? () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        KeyboardUtil.hideKeyboard(context);
                        await authController.loginwithPhone(context);
                      }
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: authController.phone,
      onChanged: (value) {
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
          return '';
        } else if (value.length != 10) {
          addError(error: kInvalidEmailError);
          return '';
        }
        return null;
      },
      maxLength: 10,
      decoration: InputDecoration(
        labelText: 'Phone',
        hintText: 'Enter your Phone Number',
        prefixText: '+91',
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/callcopy.svg'),
      ),
    );
  }
}
