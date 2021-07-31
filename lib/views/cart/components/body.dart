import 'dart:ui';

import 'package:db_vendor/controllers/controllers.dart';

import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => cartController.cartItems.isNotEmpty
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: (20)),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: Key(cartController.cartItems[index].wooProducts.id
                        .toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      cartController
                          .deleteCartItem(cartController.cartItems[index]);
                    },
                    background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Spacer(),
                          SvgPicture.asset('assets/icons/Trash.svg'),
                        ],
                      ),
                    ),
                    child: CartCard(
                      cart: cartController.cartItems[index],
                      increment: () {
                        cartController.updateCartItem(
                            cartController.cartItems[index].copyWith(
                          totalQuantity:
                              cartController.cartItems[index].totalQuantity + 1,
                        ));
                      },
                      decrement: () {
                        if (cartController.cartItems[index].totalQuantity ==
                            1) {
                          cartController
                              .deleteCartItem(cartController.cartItems[index]);
                        } else {
                          cartController.updateCartItem(
                              cartController.cartItems[index].copyWith(
                            totalQuantity:
                                cartController.cartItems[index].totalQuantity -
                                    1,
                          ));
                        }
                      },
                    ),
                  ),
                ),
              ),
            )
          : AnimatedContainer(
              duration: Duration(
                milliseconds: 200,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/empty_cart.png'),
                    Text(
                      'Oops :(\nYou Cart is Empty',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        color: kSecondaryColor,
                        fontSize: (24),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48.0, vertical: 24.0),
                      child: ElevatedButton.icon(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              elevation: MaterialStateProperty.all(0),
                              minimumSize: MaterialStateProperty.all(
                                  Size(SizeConfig.screenWidth * 0.7, (60))),
                              backgroundColor: MaterialStateProperty.all(
                                  kPrimaryLightColor)),
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: kPrimaryColor,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                          label: Text(
                            'Back to Shop',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          )),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
