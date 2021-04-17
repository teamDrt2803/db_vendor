import 'package:db_vendor/Authorization/controllers/authcontroller.dart';
import 'package:db_vendor/ui/categoryselector.dart';
import 'package:db_vendor/ui/screens/home/documents.dart';
import 'package:db_vendor/ui/constants.dart';
import 'package:db_vendor/ui/screens/orders.dart';
import 'package:db_vendor/ui/screens/profile/components/profile_menu.dart';
import 'package:db_vendor/ui/screens/sign_in/sign_in_screen.dart';
import 'package:db_vendor/ui/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../notification.dart';

class Custdrawer extends StatelessWidget {
  Custdrawer({
    Key key,
  }) : super(key: key);
  AuthController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, user) {
          return Drawer(
              child: ListView(children: [
            DrawerHeader(
              decoration: BoxDecoration(color: kPrimaryLightColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Center(
                        child: Icon(
                          Icons.person_outline,
                          size: 48,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(15),
                  ),
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        user.data == null
                            ? 'Unknown'
                            : user.data.displayName.isNotEmpty
                                ? user.data.displayName
                                : 'User',
                        textScaleFactor: 2.0,
                        style: GoogleFonts.openSans(
                          //color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ProfileMenu2(
                text: "Categories",
                icon: "assets/icons/category_icon.svg",
                press: () {
                  Get.back();
                  Get.to(() => CategorySelector());
                }),
            ProfileMenu2(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {},
            ),
            ProfileMenu2(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {
                Get.to(() => NotificationsPage());
              },
            ),
            ProfileMenu2(
              text: "My Orders",
              icon: "assets/icons/Question mark.svg",
              press: () {
                Get.to(() => Order());
              },
            ),
            ProfileMenu2(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
            ProfileMenu2(
              text: "Terms and Conditions",
              icon: "assets/icons/Question mark.svg",
              press: () {
                Get.to(() => Docs(
                      pageshow: PAGESHOW.TERMS,
                    ));
              },
            ),
            ProfileMenu2(
              text: "Privacy Policy",
              icon: "assets/icons/Question mark.svg",
              press: () {
                Get.to(() => Docs(
                      pageshow: PAGESHOW.POLICY,
                    ));
              },
            ),
            ProfileMenu2(
              text: "FAQ",
              icon: "assets/icons/Question mark.svg",
              press: () {
                Get.to(() => Docs(
                      pageshow: PAGESHOW.FAQ,
                    ));
              },
            ),
            ProfileMenu2(
              text: "About Us",
              icon: "assets/icons/Question mark.svg",
              press: () {
                Get.to(() => Docs(
                      pageshow: PAGESHOW.ABOUT,
                    ));
              },
            ),
            ProfileMenu2(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),
            ProfileMenu2(
              text: user.data == null ? "Log In" : "Log Out",
              icon: "assets/icons/Log out.svg",
              press: user.data == null
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
                            content: Text('Are your Sure yu want to Logout?'),
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
          ]));
        });
  }
}

class ProfileMenu2 extends StatelessWidget {
  const ProfileMenu2({
    Key key,
    @required this.text,
    @required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: kPrimaryColor,
              width: 16,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
