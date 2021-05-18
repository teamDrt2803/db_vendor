import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:flutter/material.dart';
import 'package:db_vendor/helpers/custom_surfix_icon.dart';
import 'package:db_vendor/helpers/default_button.dart';
import 'package:db_vendor/helpers/form_error.dart';
import 'package:get/get.dart';

import 'map_ui.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  final AuthController _authController = Get.find();
  @override
  void initState() {
    // _controller.searchResult.listen((result) {
    //   controller.text = result.name ?? '';
    // });
    super.initState();
  }

  void addError({String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
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
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEMailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildStorenameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            widget: _authController.processing
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  )
                : null,
            text: 'continue',
            press: () async {
              if (_formKey.currentState.validate()) {
                await _authController.completeSetup();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: _authController.address,
      readOnly: true,
      onChanged: (value) {
        if (_authController.address.text.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
      },
      validator: (value) {
        if (_authController.address.text.isEmpty) {
          addError(error: kAddressNullError);
          return '';
        }
        return null;
      },
      onTap: () async {
        await Get.to(() => GoogleMaps());
      },
      decoration: InputDecoration(
        labelText: 'Address',
        hintText: 'Click to choose your address',
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: 'assets/icons/Location point.svg'),
      ),
    );
  }

  TextFormField buildStorenameFormField() {
    return TextFormField(
      controller: _authController.storeName,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: 'Please Enter Store Name');
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: 'Please Enter Store Name');
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Store Name',
        hintText: 'Enter your Store name',
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Icon(Icons.store_outlined),
        ),
        // CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildEMailFormField() {
    return TextFormField(
      controller: _authController.email,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: 'Please Enter Email Address');
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: 'Please Enter Email Address');
          return '';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email address',
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Icon(Icons.email_outlined),
        ),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: _authController.displayName,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'First Name',
        hintText: 'Enter your first name',
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/User.svg'),
      ),
    );
  }
}
