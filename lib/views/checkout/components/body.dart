import 'package:db_vendor/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
        child: Column(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    'Delivering to'.toUpperCase(),
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
                  Center(
                    child: Obx(
                      () => Text(
                        _authController.firestoreUser.value.displayName,
                        style: GoogleFonts.openSans(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Obx(
                      () => Text(
                        _authController.userStream.value.phoneNumber,
                        style: GoogleFonts.openSans(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Obx(
                () => Column(
                  children: [
                    // ...List.generate(_cartController.cartItems.length, (index) => _cartController.cartItems[index].),
                    ListTile(
                      leading: Icon(Icons.delivery_dining),
                      title: Text(''),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Column(),
            ),
          ],
        ),
      ),
    );
  }
}
