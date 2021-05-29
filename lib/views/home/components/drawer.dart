import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/views/categoryselector.dart';

import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/views/views.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:core';
import 'package:url_launcher/url_launcher.dart';
import '../documents.dart';

class Custdrawer extends StatelessWidget {
  Custdrawer({
    Key key,
  }) : super(key: key);
  final AuthController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: _controller.auth.userChanges(),
      builder: (context, user) {
        return Drawer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 16,
                      color: kSecondaryColor.withOpacity(0.1),
                    ),
                  ],
                  color: Colors.white,
                ),
                currentAccountPicture: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 5),
                        blurRadius: 16,
                        color: kSecondaryColor.withOpacity(0.2),
                      ),
                    ],
                    color: kPrimaryLightColor,
                  ),
                  child: Icon(
                    Icons.person_outline_outlined,
                    color: kPrimaryColor,
                  ),
                ),
                accountName: Text(
                  user.data == null
                      ? 'Unknown'
                      : _controller.firestoreUser.value.displayName,
                  // maxLines: 2,
                  textScaleFactor: 2.0,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                accountEmail: Text(
                  user.data == null ? '' : _controller.user.phoneNumber,
                ),
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    ProfileMenu2(
                        text: 'Categories',
                        icon: 'assets/icons/category_icon.svg',
                        press: () {
                          Get.back();
                          Get.to(() => CategorySelector());
                        }),
                    ProfileMenu2(
                      text: 'My Account',
                      icon: 'assets/icons/User Icon.svg',
                      press: () => {Get.toNamed(ProfileScreen.routeName)},
                    ),
                    ProfileMenu2(
                      text: 'Notifications.',
                      icon: 'assets/icons/Bell.svg',
                      press: () {
                        Get.to(() => NotificationsPage());
                      },
                    ),
                    ProfileMenu2(
                      text: 'My Orders',
                      icon: 'assets/icons/Question mark.svg',
                      press: () {
                        Get.to(() => MyOrders());
                        //Get.to(() => Order());
                      },
                    ),
                    ProfileMenu2(
                      text: 'Terms and Conditions',
                      icon: 'assets/icons/Question mark.svg',
                      press: () {
                        Get.to(() => Docs(
                              pageshow: PAGESHOW.TERMS,
                            ));
                      },
                    ),
                    ProfileMenu2(
                      text: 'Privacy Policy',
                      icon: 'assets/icons/Question mark.svg',
                      press: () {
                        Get.to(() => Docs(
                              pageshow: PAGESHOW.POLICY,
                            ));
                      },
                    ),
                    ProfileMenu2(
                      text: 'FAQ',
                      icon: 'assets/icons/Question mark.svg',
                      press: () {
                        Get.to(() => Docs(
                              pageshow: PAGESHOW.FAQ,
                            ));
                      },
                    ),
                    ProfileMenu2(
                      text: 'About Us',
                      icon: 'assets/icons/Question mark.svg',
                      press: () {
                        Get.to(() => Docs(
                              pageshow: PAGESHOW.ABOUT,
                            ));
                      },
                    ),
                    ProfileMenu2(
                      text: 'Help Center',
                      icon: 'assets/icons/Question mark.svg',
                      press: () {
                        final _emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: 'customercare.discountbazaar@gmail.com',
                          queryParameters: {
                            'subject':
                                'Help\tAbout\tDiscount\tBazaar\tVendor\tmobile\tapplication'
                          },
                        );
                        Get.generalDialog(pageBuilder: (context, _, __) {
                          return Center(
                            child: AlertDialog(
                              title: Text('Attention Needed'),
                              content: Text(
                                  'Currently We provide support only via email. \nClick okay to directly open you preferred email application and send us an email. \nElse you can manually email us at \ncustomercare.discountbazaar@gmail.com'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    //launch(_emailLaunchUri.toString());
                                    Get.back();
                                  },
                                  child: Text('Canecel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    launch(_emailLaunchUri.toString());
                                    Get.back();
                                  },
                                  child: Text('Okay'),
                                ),
                              ],
                            ),
                          );
                        });
                      },
                    ),
                    ProfileMenu2(
                      text: user.data == null ? 'Log In' : 'Log Out',
                      icon: 'assets/icons/Log out.svg',
                      press: user.data == null
                          ? () {
                              Get.to(
                                () => SignInScreen(),
                              );
                            }
                          : () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Are you Sure?'),
                                    content: Text(
                                        'Are your Sure yu want to Logout?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          _controller.signout(context);
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
                ),
              ),
            ],
          ),
        );
      },
    );
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
    // ignore: deprecated_member_use
    return FlatButton(
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 28),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
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
    );
  }
}
