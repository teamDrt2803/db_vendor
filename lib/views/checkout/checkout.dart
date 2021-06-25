import 'package:db_vendor/controllers/cartcontroller.dart';
import 'package:db_vendor/helpers/custappbar.dart';
import 'package:db_vendor/helpers/default_button.dart';
import 'package:db_vendor/modals/orders.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:db_vendor/views/views.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/body.dart';

class CheckoutScreen extends StatelessWidget {
  final double total;
  final discount;
  final cartTotal;

  final CartController _cartController = Get.find();

  CheckoutScreen(
      {Key key,
      @required this.total,
      @required this.cartTotal,
      @required this.discount})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [],
        ),
        height: SizeConfig.screenHeight * 0.1,
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: Obx(
          () => DefaultButton(
            widget: _cartController.processing
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  )
                : null,
            press: () async {
              if (_cartController.addressItems.isEmpty) {
                // ignore: unawaited_futures
                Get.dialog(AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  title: Text('Address Required',
                      style: GoogleFonts.roboto(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                  content: Text(
                      'Add a shipping address first so that we can deliver your product to you.\nClick ADD to add a new address.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('CANCEL'),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                        Get.to(() => AddressScreen());
                      },
                      child: Text('ADD'),
                    ),
                  ],
                ));
              } else {
                if (_cartController.processing) return;
                var time = DateTime.now();
                _cartController.processing = true;
                var cart = _cartController.cartItems;
                var coupon = _cartController.selectedCoupon.value;
                // _cartController.cartItems.forEach((element) {
                //   var amount = (double.parse(element.totalQuantity.toString()) *
                //       double.parse(element.wooProducts.salesPrice.toString()));
                //   cartTotal = cartTotal + double.parse(amount.toString());
                // });
                // if (coupon.newCustomersOnly) {
                //   if (_cartController.orders.isEmpty) {
                //     if (cartTotal >= coupon.minCartValue) {
                //       switch (coupon.type) {
                //         case 'Rs':
                //           discount = coupon.maxDiscount.toDouble();
                //           cartTotal = cartTotal - coupon.maxDiscount;
                //           break;
                //         default:
                //           discount = cartTotal * (coupon.discount / 100);
                //           if (discount > coupon.maxDiscount) {
                //             discount = coupon.maxDiscount.toDouble();
                //           }
                //           cartTotal = cartTotal - discount;
                //       }
                //     }
                //   }
                // } else {
                //   if (cartTotal >= coupon.minCartValue) {
                //     switch (coupon.type) {
                //       case 'Rs':
                //         discount = coupon.maxDiscount.toDouble();
                //         cartTotal = cartTotal - coupon.maxDiscount;
                //         break;
                //       default:
                //         discount = cartTotal * (coupon.discount / 100);
                //         if (discount > coupon.maxDiscount) {
                //           discount = coupon.maxDiscount.toDouble();
                //         }
                //         cartTotal = cartTotal - discount;
                //     }
                //   }
                // }
                var ordersItem = OrdersItem(
                  timeStamp: time.microsecondsSinceEpoch,
                  cartItems: cart,
                  originalPrice: total + 40 + 100 + discount,
                  appliedCoupon: coupon,
                  discountedPrice: cartTotal + 40 + 100,
                  disocunt: discount,
                );
                await _cartController.addOrderItem(ordersItem);
                await _cartController.emptyCart();
                _cartController.processing = false;
                // ignore: unawaited_futures
                Get.off(() => OrderPlacedScreen());
              }
            },
            text: 'PLACE ORDER',
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      appBar: CustAppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            }),
        title: Text('Order complete'),
      ),
      body: Body(
        cartTotal: cartTotal,
        discount: discount,
      ),
    );
  }
}
