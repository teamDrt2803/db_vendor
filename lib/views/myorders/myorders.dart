import 'package:db_vendor/controllers/cartcontroller.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:db_vendor/views/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MyOrders extends StatelessWidget {
  CartController _cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: Container(
        child: Obx(() => ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: _cartController.cartList.length,
            itemBuilder: (context, index) {
              var orders = _cartController.cartList[index];
              var date = DateTime.fromMillisecondsSinceEpoch(orders.time);
              var format = DateFormat('dd MMMM yyyy').format(date);
              var timeHours = DateFormat('hh:mm a').format(date);
              if (DateTime.now().day == date.day) {
                format = 'Today';
              } else if (date.day - DateTime.now().day == 1) {
                format = 'Yesterday';
              }
              var visible = true;
              if (index != _cartController.cartList.length - 1 && index != 0) {
                if (orders.time == _cartController.cartList[index - 1].time) {
                  visible = false;
                } else {
                  visible = true;
                }
              } else if (index == _cartController.cartList.length - 1) {
                if (orders.time - _cartController.cartList[index - 1].time >
                        3600000 ||
                    _cartController.cartList[index - 1].time - orders.time >
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
                          format + " at " + timeHours,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: getProportionateScreenHeight(100),
                      margin:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: kSecondaryColor.withOpacity(0.7),
                            offset: Offset(0, 3),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Center(
                        child: ListTile(
                          title: Text(orders.wooProducts.name +
                              ' (${orders.totalQuantity})'),
                          subtitle: Text("₹ " +
                              (int.parse(orders.wooProducts.salesPrice) *
                                      orders.totalQuantity)
                                  .toString()),
                          leading: Container(
                              child: Image.network(
                            orders.wooProducts.images.first.src,
                            height: 80,
                            //width: 80,
                          )),
                          trailing: TextButton(
                            onPressed: () {
                              _cartController.addToCart(
                                products: orders.wooProducts,
                                item: orders.totalQuantity,
                              );
                              Get.to(() => CartScreen());
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
            })),
      ),
    );
  }
}
