import 'package:db_vendor/Authorization/controllers/authcontroller.dart';
import 'package:db_vendor/main.dart';
import 'package:db_vendor/orders/cartmodal.dart';
import 'package:db_vendor/ui/screens/sign_in/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:db_vendor/ui/components/default_button.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CheckoutCard extends StatelessWidget {
  CheckoutCard({
    Key key,
  }) : super(key: key);
  AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: _authController.user,
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(15),
              horizontal: getProportionateScreenWidth(30),
            ),
            // height: 174,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -15),
                  blurRadius: 20,
                  color: Color(0xFFDADADA).withOpacity(0.15),
                )
              ],
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: getProportionateScreenWidth(40),
                        width: getProportionateScreenWidth(40),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F6F9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset("assets/icons/receipt.svg"),
                      ),
                      Spacer(),
                      Text("Add voucher code"),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: kTextColor,
                      )
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  ValueListenableBuilder<Box<CartModal>>(
                      valueListenable: box.listenable(),
                      builder: (context, box, _) {
                        double cartTotal = 0.0;
                        box.values.toList().forEach((element) {
                          double abc =
                              double.parse(element.totalQuantity.toString()) *
                                  double.parse(element.wooProducts.price);
                          cartTotal = cartTotal + double.parse(abc.toString());
                        });
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: "Total:\n",
                                children: [
                                  TextSpan(
                                    text: "\₹$cartTotal",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(190),
                              child: DefaultButton(
                                text: "Check Out",
                                press: () {
                                  if (snapshot.data == null) {
                                    Get.to(
                                      () => SignInScreen(
                                        authController: _authController,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
          );
        });
  }
}
