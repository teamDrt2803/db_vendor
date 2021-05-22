import 'package:another_flushbar/flushbar_helper.dart';
import 'package:db_vendor/helpers/default_button.dart';
import 'package:db_vendor/views/sign_in/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/helpers/constants.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  final AuthController _controller = Get.find();
  final CartController _cartController = Get.find();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: StreamBuilder<User>(
          stream: auth.userChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return Column(
                children: [
                  ProfilePic(),
                  SizedBox(height: 20),
                  Obx(
                    () => ProfileMenu(
                      showEdit: true,
                      text: _controller.firestoreUser.value.displayName,
                      icon: 'assets/icons/User Icon.svg',
                      press: () {
                        _buildShowModalBottomSheet(context);
                      },
                      label: 'Name',
                    ),
                  ),
                  ProfileMenu(
                    showEdit: false,
                    text: auth.currentUser.phoneNumber,
                    label: 'Phone',
                    icon: 'assets/icons/Question mark.svg',
                    press: () {},
                  ),
                  Obx(
                    () => ProfileMenu(
                      showEdit: false,
                      text: _controller.firestoreUser.value.email,
                      label: 'Email',
                      icon: 'assets/icons/Question mark.svg',
                      press: () {},
                    ),
                  ),
                  Obx(
                    () => ProfileMenu(
                      showEdit: false,
                      text: _cartController.addressItems[0].toString(),
                      label: 'Address',
                      icon: 'assets/icons/Question mark.svg',
                      press: () {},
                    ),
                  )
                ],
              );
            } else {
              return Flexible(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: DefaultButton(
                    text: 'Login to your Accout',
                    press: () {
                      Get.to(() => SignInScreen());
                    },
                  ),
                ),
              );
            }
          }),
    );
  }

  Future<dynamic> _buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    initialValue: _controller.firestoreUser.value.displayName,
                    onChanged: (value) {
                      namecontroller.text = value;
                    },
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        if (namecontroller.text.length >= 6 &&
                            namecontroller.text !=
                                _controller.firestoreUser.value.displayName) {
                          _controller.updateUserName(
                            namecontroller.text,
                          );
                          FlushbarHelper.createInformation(
                              message: 'Updated username');
                          Get.back();
                        } else {
                          Get.back();
                        }
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
