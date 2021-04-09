import 'package:db_vendor/Authorization/controllers/authcontroller.dart';
import 'package:db_vendor/ui/components/default_button.dart';
import 'package:db_vendor/ui/screens/sign_in/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  AuthController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: StreamBuilder<User>(
          stream: _controller.user,
          builder: (context, snapshot) {
            return snapshot.data == null
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 24.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DefaultButton(
                            text: 'Login',
                            press: () {
                              Get.to(
                                () => SignInScreen(
                                  authController: _controller,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  )
                : Column(
                    children: [
                      ProfilePic(),
                      SizedBox(height: 20),
                      ProfileMenu(
                        text: "My Account",
                        icon: "assets/icons/User Icon.svg",
                        press: () => {},
                      ),
                      ProfileMenu(
                        text: "Notifications",
                        icon: "assets/icons/Bell.svg",
                        press: () {},
                      ),
                      ProfileMenu(
                        text: "My Orders",
                        icon: "assets/icons/Question mark.svg",
                        press: () {},
                      ),
                      ProfileMenu(
                        text: "Settings",
                        icon: "assets/icons/Settings.svg",
                        press: () {},
                      ),
                      ProfileMenu(
                        text: "Terms and Conditions",
                        icon: "assets/icons/Question mark.svg",
                        press: () {},
                      ),
                      ProfileMenu(
                        text: "Privacy Policy",
                        icon: "assets/icons/Question mark.svg",
                        press: () {
                          //Get.to(()=>Privacy)
                        },
                      ),
                      ProfileMenu(
                        text: "Help Center",
                        icon: "assets/icons/Question mark.svg",
                        press: () {},
                      ),
                      ProfileMenu(
                        text: "Log Out",
                        icon: "assets/icons/Log out.svg",
                        press: () {
                          //Get.dialog(widget)
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Are you Sure?'),
                                content:
                                    Text('Are your Sure yu want to Logout?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      _controller.signOut(context);
                                    },
                                    child: Text('YES'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text('CANCEL'),
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  );
          }),
    );
  }
}
