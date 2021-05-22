import 'package:another_flushbar/flushbar_helper.dart';
import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/helpers/custappbar.dart';
import 'package:db_vendor/helpers/default_button.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:db_vendor/views/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../views.dart';

class MyOrders extends StatelessWidget {
  final CartController _cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustAppBar(
        title: Text('My Orders'),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        child: Obx(
          () => _cartController.orders.isNotEmpty
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: _cartController.orders.length,
                  itemBuilder: (context, index) {
                    var orders = _cartController.orders[index];
                    var date = DateTime.fromMillisecondsSinceEpoch(orders.time);
                    var format = DateFormat('dd MMMM yyyy').format(date);
                    var timeHours = DateFormat('hh:mm a').format(date);
                    if (DateTime.now().day == date.day) {
                      format = 'Today';
                    } else if (date.day - DateTime.now().day == 1) {
                      format = 'Yesterday';
                    }
                    var visible = true;
                    if (index != _cartController.orders.length - 1 &&
                        index != 0) {
                      if (orders.time ==
                          _cartController.orders[index - 1].time) {
                        visible = false;
                      } else {
                        visible = true;
                      }
                    } else if (index == _cartController.orders.length - 1) {
                      if (orders.time -
                                  _cartController
                                      .orders[index - 1 >= 0 ? index - 1 : 0]
                                      .time >
                              3600000 ||
                          _cartController.orders[index - 1 >= 0 ? index - 1 : 0]
                                      .time -
                                  orders.time >
                              3600000) {
                        visible = true;
                      } else {
                        visible = false;
                      }
                    } else if (index == 0) {
                      visible = true;
                    }

                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: visible,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 16.0),
                              child: Text(
                                format + ' at ' + timeHours,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: getProportionateScreenHeight(100),
                            margin: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: Offset(0, 5),
                                  blurRadius: 16,
                                ),
                              ],
                            ),
                            child: Center(
                              child: ListTile(
                                isThreeLine: true,
                                title: Text(
                                  orders.wooProducts.name +
                                      ' (${orders.totalQuantity})',
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w700,
                                    color: kTextColor,
                                  ),
                                ),
                                subtitle: Text('₹ ' +
                                    (int.parse(orders.wooProducts.salesPrice) *
                                            orders.totalQuantity)
                                        .toString() +
                                    '\norder Id: #${orders.time}'),
                                leading: Container(
                                    child: Image.network(
                                  orders.wooProducts.images.first.src,
                                  height: 80,
                                  //width: 80,
                                )),
                                trailing: TextButton(
                                  onPressed: () async {
                                    var done =
                                        await _cartController.addCartItem(
                                      orders,
                                    );
                                    if (done) {
                                      // ignore: unawaited_futures

                                      // ignore: unawaited_futures
                                      Get.to(() => CartScreen());
                                      // ignore: unawaited_futures
                                      FlushbarHelper.createInformation(
                                              message:
                                                  '${orders.wooProducts.name} added to cart')
                                          .show(context);
                                    } else {
                                      // ignore: unawaited_futures
                                      FlushbarHelper.createInformation(
                                              message:
                                                  'PLease login first to add Items to cart')
                                          .show(context);
                                    }
                                  },
                                  child: Text(
                                    'Re-order',
                                    style: GoogleFonts.roboto(
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: DefaultButton(
                    text: 'Login to your Accout',
                    press: () {
                      Get.to(() => SignInScreen());
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
