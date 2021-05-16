import 'package:db_vendor/views/offers.dart';
import 'package:db_vendor/views/brands.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:db_vendor/views/views.dart';
import 'package:get/get.dart';

import 'constants.dart';
import 'enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/Shop Icon.svg',
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              IconButton(
                icon: Icon(
                  Icons.verified_outlined,
                  color: MenuState.message == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  Get.to(() => OffersScreen());
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.branding_watermark_outlined,
                  color: MenuState.favourite == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () => Get.to(() => BrandList()),
              ),
            ],
          )),
    );
  }
}
