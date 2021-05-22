import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/modals/modals.dart';
import 'package:db_vendor/helpers/constants.dart';

import 'package:db_vendor/modals/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  final void Function() onPressed;

  Body({Key key, this.onPressed}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  final AuthController _authController = Get.find();
  final CartController _cartController = Get.find();

  // final CartController authController = Get.find();

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController contactNumber = TextEditingController();
  final TextEditingController houseNo = TextEditingController();
  final TextEditingController appartmentName = TextEditingController();
  final TextEditingController streetAddress = TextEditingController();
  final TextEditingController landmark = TextEditingController();
  final TextEditingController areaDetails = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController pincode = TextEditingController();

  @override
  void initState() {
    contactNumber.text = _authController.auth.currentUser.phoneNumber;
    firstName.text = _authController.firestoreUser.value.displayName ??
        _authController.auth.currentUser.displayName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: formState,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Personal Details',
                      style: GoogleFonts.openSans(
                        fontSize: getProportionateScreenWidth(28),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) return 'Field is required';
                              return null;
                            },
                            controller: firstName,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              labelText: 'Billing Name',
                              border: UnderlineInputBorder(),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(),
                              disabledBorder: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    Flexible(
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) return 'Field is required';
                          return null;
                        },
                        controller: contactNumber,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          labelText: 'Contact Number for Updates',
                          border: UnderlineInputBorder(),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(),
                          disabledBorder: UnderlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    Text(
                      'Address Details',
                      style: GoogleFonts.openSans(
                        fontSize: getProportionateScreenWidth(28),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) return 'Field is required';
                              return null;
                            },
                            controller: houseNo,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              labelText: '*Shop Number',
                              border: UnderlineInputBorder(),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(),
                              disabledBorder: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                        Flexible(
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) return 'Field is required';
                              return null;
                            },
                            controller: appartmentName,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              labelText: 'Shop Name',
                              border: UnderlineInputBorder(),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(),
                              disabledBorder: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    Flexible(
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) return 'Field is required';
                          return null;
                        },
                        controller: streetAddress,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          labelText: 'Street Details',
                          border: UnderlineInputBorder(),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(),
                          disabledBorder: UnderlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    Flexible(
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) return 'Field is required';
                          return null;
                        },
                        controller: landmark,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          labelText: 'Landmark',
                          border: UnderlineInputBorder(),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(),
                          disabledBorder: UnderlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    Flexible(
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) return 'Field is required';
                          return null;
                        },
                        controller: areaDetails,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          labelText: '*Area Details',
                          border: UnderlineInputBorder(),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(),
                          disabledBorder: UnderlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: TextFormField(
                            initialValue: 'Chhindwara',
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              labelText: '*City',
                              border: UnderlineInputBorder(),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(),
                              disabledBorder: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                        Flexible(
                          child: TextFormField(
                            initialValue: '480001',
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              labelText: 'Pincode',
                              border: UnderlineInputBorder(),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(),
                              disabledBorder: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(120),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () async {
          var modal = AddressModal();
          if (formState.currentState.validate()) {
            formState.currentState.save();
            modal = modal.copyWith(
              appartmentName: appartmentName.text,
              areaDetails: areaDetails.text,
              firstname: firstName.text,
              lastName: lastName.text,
              contactName: contactNumber.text,
              houseNo: houseNo.text,
              streetName: streetAddress.text,
              landMark: landmark.text,
              city: city.text,
              pincode: pincode.text,
            );
            if (_cartController.addressItems.isEmpty) {
              modal = modal.copyWith(primary: true);
              await _cartController.addAddress(modal).then(
                    (value) => Get.back(),
                  );
            } else {
              await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                          'Do you want to use this address as default for future orders?'),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            await _cartController.addAddress(modal).then(
                                  (value) => Get.back(),
                                );
                          },
                          child: Text('No'),
                        ),
                        TextButton(
                          onPressed: () async {
                            modal = modal.copyWith(primary: true);
                            await _cartController.addAddress(modal).then(
                                  (value) => Get.back(),
                                );
                          },
                          child: Text('Yes'),
                        )
                      ],
                    );
                  });
            }
          }
        },
        child: Icon(Icons.save_outlined),
      ),
    );
  }
}
