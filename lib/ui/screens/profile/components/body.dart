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
  FirebaseAuth auth = FirebaseAuth.instance;
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
                  text: snapshot.data == null ? "Log In" : "Log Out",
                  icon: "assets/icons/Log out.svg",
                  press: snapshot.data == null
                      ? () {
                          Get.to(
                            () => SignInScreen(
                              authController: _controller,
                            ),
                          );
                        }
                      : () {
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
