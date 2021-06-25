import 'package:another_flushbar/flushbar_helper.dart';
import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/helpers/custappbar.dart';
import 'package:db_vendor/helpers/default_button.dart';
import 'package:db_vendor/modals/modals.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:db_vendor/views/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../views.dart';
import 'package:db_vendor/helpers/extensions.dart';

class MyOrders extends StatelessWidget {
  final CartController _cartController = Get.find();
  final AuthController _authController = Get.find();

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
          () => _authController.userStream.value != null
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: _cartController.orders.length,
                  itemBuilder: (context, index) {
                    var orders = _cartController.orders[index];
                    var date =
                        DateTime.fromMicrosecondsSinceEpoch(orders.timeStamp);
                    var format = DateFormat('dd MMM').format(date);
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0),
                            child: Text(
                              '$format #${orders.documentID}',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: orders.cartItems.length,
                              itemBuilder: (context, index) {
                                var cartItem = orders.cartItems[index];
                                return OrderTile(
                                    orders: cartItem,
                                    cartController: _cartController,
                                    subtitle: (int.parse(cartItem
                                                .wooProducts.salesPrice) *
                                            cartItem.totalQuantity)
                                        .toString()
                                        .rupee(),
                                    title: cartItem.wooProducts.name,
                                    imgSrc: cartItem.wooProducts.images[0].src);
                              })
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

class OrderTile extends StatelessWidget {
  const OrderTile({
    Key key,
    @required this.orders,
    @required CartController cartController,
    @required this.subtitle,
    @required this.title,
    @required this.imgSrc,
  })  : _cartController = cartController,
        super(key: key);

  final CartModal orders;
  final CartController _cartController;
  final String title;
  final String subtitle;
  final String imgSrc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(100),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
            title,
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.w700,
              color: kTextColor,
            ),
          ),
          subtitle: Text(subtitle),
          leading: Container(child: Image.network(imgSrc, height: 80)),
          trailing: TextButton(
            onPressed: () async {
              var done = await _cartController.addCartItem(
                orders,
              );
              if (done) {
                // ignore: unawaited_futures
                Get.to(() => CartScreen());
                // ignore: unawaited_futures
                FlushbarHelper.createInformation(
                        message: '${orders.wooProducts.name} added to cart')
                    .show(context);
              } else {
                // ignore: unawaited_futures
                FlushbarHelper.createInformation(
                        message: 'PLease login first to add Items to cart')
                    .show(context);
              }
            },
            child: Text(
              'Re-order',
              style: GoogleFonts.roboto(color: kPrimaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
