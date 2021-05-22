import 'package:db_vendor/controllers/cartcontroller.dart';
import 'package:db_vendor/helpers/custappbar.dart';
import 'package:db_vendor/helpers/default_button.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:db_vendor/views/views.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/body.dart';

class CheckoutScreen extends StatelessWidget {
  final double total;

  final CartController _cartController = Get.find();
  CheckoutScreen({Key key, @required this.total}) : super(key: key);
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
                var time = DateTime.now();
                if (_cartController.processing) return;
                _cartController.processing = true;
                var cart = _cartController.cartItems;
                for (var item in cart) {
                  await _cartController.addOrderItem(
                      item.copyWith(time: time.millisecondsSinceEpoch));
                }
                await _cartController.emptyCart();
                // ignore: unawaited_futures
                Get.off(() => OrderPlacedScreen());
                _cartController.processing = false;
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
      body: Body(),
    );
  }
}
