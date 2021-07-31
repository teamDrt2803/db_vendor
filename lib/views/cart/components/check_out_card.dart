import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:db_vendor/views/coupons.dart';
import 'package:db_vendor/views/views.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:db_vendor/helpers/default_button.dart';
import 'package:get/get.dart';

class CheckoutCard extends StatelessWidget {
  CheckoutCard({
    Key key,
  }) : super(key: key);
  final CartController _cartController = Get.find();
  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: (15),
        horizontal: (30),
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
                  height: (40),
                  width: (40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset('assets/icons/receipt.svg'),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => Get.toNamed(CouponsScreen.routesName),
                  child: Obx(
                    () => Text(
                      _cartController.selectedCoupon.value == null
                          ? 'Add Coupon code'
                          : _cartController.selectedCoupon.value.code,
                      style: _cartController.selectedCoupon.value == null
                          ? null
                          : Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Obx(() => _cartController.selectedCoupon.value == null
                    ? Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: kTextColor,
                      )
                    : GestureDetector(
                        onTap: () {
                          _cartController.selectedCoupon.value = null;
                        },
                        child: Icon(
                          Icons.cancel_outlined,
                          size: 24,
                          color: Colors.red,
                        ),
                      ))
              ],
            ),
            SizedBox(height: (20)),
            Obx(() {
              var cartTotal = 0.0;
              var discount = 0.0;
              _cartController.cartItems.forEach((element) {
                var amount = (double.parse(element.totalQuantity.toString()) *
                    double.parse(element.wooProducts.salesPrice.toString()));
                cartTotal = cartTotal + double.parse(amount.toString());
              });
              if (_cartController.selectedCoupon.value != null) {
                var coupon = _cartController.selectedCoupon.value;
                debugPrint(coupon.newCustomersOnly.toString());
                if (coupon.newCustomersOnly) {
                  if (_cartController.orders.isEmpty) {
                    if (cartTotal >= coupon.minCartValue) {
                      switch (coupon.type) {
                        case 'Rs':
                          discount = coupon.maxDiscount.toDouble();
                          cartTotal = cartTotal - coupon.maxDiscount;
                          break;
                        default:
                          discount = cartTotal * (coupon.discount / 100);
                          if (discount > coupon.maxDiscount) {
                            discount = coupon.maxDiscount.toDouble();
                          }
                          cartTotal = cartTotal - discount;
                      }
                    }
                  }
                } else {
                  if (cartTotal >= coupon.minCartValue) {
                    switch (coupon.type) {
                      case 'Rs':
                        discount = coupon.maxDiscount.toDouble();

                        cartTotal = cartTotal - coupon.maxDiscount;
                        break;
                      default:
                        discount = cartTotal * (coupon.discount / 100);
                        if (discount > coupon.maxDiscount) {
                          discount = coupon.maxDiscount.toDouble();
                        }
                        cartTotal = cartTotal - discount;
                    }
                  }
                }
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Total:\n',
                      children: [
                        TextSpan(
                          text: '\₹$cartTotal',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: (190),
                    child: Obx(
                      () => DefaultButton(
                        text: 'Check Out',
                        press: _authController.userStream.value == null
                            ? () {
                                Get.toNamed(
                                  SignInScreen.routeName,
                                );
                              }
                            : () {
                                if (cartTotal > 0) {
                                  Get.to(
                                    () => CheckoutScreen(
                                      cartTotal: cartTotal,
                                      discount: discount,
                                      total: cartTotal,
                                    ),
                                  );
                                }
                              },
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
