import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:db_vendor/views/views.dart';
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
  String firstName;
  String email;
  String storeName;
  String address;
  AuthController _controller = Get.find();
  TextEditingController controller = TextEditingController();
  bool process = false;
  @override
  void initState() {
    _controller.searchResult.listen((result) {
      controller.text = result.name ?? '';
    });
    super.initState();
  }

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
            widget: process
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  )
                : null,
            text: "continue",
            press: () {
              print(firstName);
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                if (mounted)
                  setState(() {
                    process = true;
                  });
                _controller
                    .completeSetup(
                  email: email,
                  storeName: storeName,
                  userName: firstName,
                )
                    .then((value) async {
                  if (mounted)
                    setState(() {
                      process = false;
                    });
                  await Get.to(() => LoginSuccessScreen());
                });
              }
              print(firstName);
            },
          ),
        ],
      ),
    );
  }

  buildAddressFormField() {
    return TextFormField(
      controller: controller,
      readOnly: true,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      onTap: () {
        Get.to(() => GoogleMaps());
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your phone address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildStorenameFormField() {
    return TextFormField(
      onSaved: (newValue) => storeName = newValue,
      onChanged: (value) {
        storeName = value;
        if (value.isNotEmpty) {
          removeError(error: 'Please Enter Store Name');
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: 'Please Enter Store Name');
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Store Name",
        hintText: "Enter your Store name",
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
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        email = value;
        if (value.isNotEmpty) {
          removeError(error: 'Please Enter Email Address');
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: 'Please Enter Email Address');
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email address",
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

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      //onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      //onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) {},
      onChanged: (value) {
        firstName = value;

        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
