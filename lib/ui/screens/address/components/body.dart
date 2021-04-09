import 'package:db_vendor/ui/models/Address.dart';
import 'package:db_vendor/ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  final GlobalKey<FormState> formState;
  void Function() onPressed;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController houseNo = TextEditingController();
  TextEditingController appartmentName = TextEditingController();
  TextEditingController streetAddress = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController areaDetails = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController pincode = TextEditingController();
  Body({Key key, this.formState, this.onPressed}) : super(key: key);
  addAdress() {
    AddressModal modal;
    if (formState.currentState.validate()) {
      modal.appartmentName = appartmentName.text;
      modal.areaDetails = areaDetails.text;
      modal.firstname = firstName.text;
      modal.lastName = lastName.text;
      modal.contactName = contactNumber.text;
      modal.houseNo = houseNo.text;
      modal.streetName = streetAddress.text;
      modal.landMark = landmark.text;
      modal.city = city.text;
      modal.pincode = pincode.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                        labelText: 'First Name',
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
                      controller: lastName,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        labelText: 'Last Name',
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
                        labelText: '*House Number',
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
                        labelText: 'Appartment Name',
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
                      controller: city,
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
                      controller: pincode,
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
            ],
          ),
        ),
      ),
    );
  }
}
