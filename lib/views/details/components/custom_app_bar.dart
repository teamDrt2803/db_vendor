import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:db_vendor/views/home/components/icon_btn_with_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../views.dart';

class CustomAppBar extends PreferredSize {
  final CartController _cartController = Get.find();
  final double rating;

  CustomAppBar({@required this.rating});

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: (20)),
        child: Row(
          children: [
            SizedBox(
              height: (40),
              width: (40),
              // ignore: deprecated_member_use
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                color: Colors.white,
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  'assets/icons/Back ICon.svg',
                  height: 15,
                ),
              ),
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Obx(
                    () => IconBtnWithCounter(
                      svgSrc: 'assets/icons/Cart Icon.svg',
                      numOfitem: _cartController.cartItems.length,
                      press: () => Get.to(() => CartScreen()),
                    ),
                  ),
                  SizedBox(
                    width: (20),
                  ),
                  Text(
                    '$rating',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset('assets/icons/Star Icon.svg'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
