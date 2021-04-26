import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/helpers/custom_surfix_icon.dart';

import 'package:db_vendor/views/notification.dart';

import 'package:db_vendor/views/views.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  final AuthController _controller = Get.find();
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController namecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: StreamBuilder<User>(
          stream: auth.userChanges(),
          builder: (context, snapshot) {
            return Column(
              children: [
                ProfilePic(),
                SizedBox(height: 20),
                Obx(
                  () => ProfileMenu(
                    text: _controller.userName.value,
                    icon: "assets/icons/User Icon.svg",
                    press: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(5.0, 5.0),
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0)
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      controller: namecontroller,
                                      decoration:
                                          InputDecoration(labelText: "Name"),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: TextButton(
                                        child: Text(
                                          "Save",
                                          style:
                                              TextStyle(color: kPrimaryColor),
                                        ),
                                        onPressed: () {
                                          if (namecontroller.text.length >= 6) {
                                            _controller.updateName(
                                                name: namecontroller.text);
                                            Get.back();
                                          } else {
                                            Get.snackbar(
                                                "Username should be greate than 6 letters.",
                                                "Please re-check your input.");
                                          }
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    label: "Name",
                  ),
                ),
                ProfileMenu(
                  text: "7666071669",
                  label: "Phone",
                  icon: "assets/icons/Question mark.svg",
                  press: () {},
                ),
                Obx(
                  () => ProfileMenu(
                    text: _controller.email.value,
                    label: "Email",
                    icon: "assets/icons/Question mark.svg",
                    press: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(5.0, 5.0),
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0)
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      controller: emailcontroller,
                                      decoration:
                                          InputDecoration(labelText: "Email"),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: TextButton(
                                        child: Text(
                                          "Save",
                                          style:
                                              TextStyle(color: kPrimaryColor),
                                        ),
                                        onPressed: () {
                                          if (emailcontroller.text.isEmail) {
                                            _controller.updateEmail(
                                                email: emailcontroller.text);
                                            Get.back();
                                          } else {
                                            Get.snackbar(
                                                "Please enter a valid email.",
                                                "");
                                          }
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                  ),
                ),
                ProfileMenu(
                  text: "106,Ambika Bhuvan,Kopar road,Dombivli(West).",
                  label: "Address",
                  icon: "assets/icons/Question mark.svg",
                  press: () {},
                )
              ],
            );
          }),
    );
  }
}
