import 'package:db_vendor/Authorization/controllers/cartcontroller.dart';
import 'package:db_vendor/main.dart';
import 'package:db_vendor/orders/cartmodal.dart';
import 'package:db_vendor/ui/components/default_button.dart';
import 'package:db_vendor/ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:db_vendor/ui/models/Cart.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../../../size_config.dart';
import 'cart_card.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<CartModal>>(
        valueListenable: box.listenable(),
        builder: (context, box, _) {
          if (box.length > 0) {
            List<CartModal> cartList = box.values.toList();
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: cartList.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: Key(cartList[index].wooProducts.id.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      cartController.deleteCartItem(index);
                      // setState(() {
                      //   demoCarts.removeAt(index);
                      // });
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
                          SvgPicture.asset("assets/icons/Trash.svg"),
                        ],
                      ),
                    ),
                    child: CartCard(
                      cart: cartList[index],
                      increment: () {
                        cartController.incrementCart(index, cartList[index]);
                      },
                      decrement: () {
                        if (cartList[index].totalQuantity == 1) {
                          cartController.deleteCartItem(index);
                        } else {
                          cartController.decrementCart(index, cartList[index]);
                        }
                      },
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Oops :(\nYou Cart is Empty',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        color: kSecondaryColor,
                        fontSize: getProportionateScreenWidth(30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48.0, vertical: 24.0),
                      child: DefaultButton(
                        text: 'Back to Shop',
                        press: () {
                          Get.back();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
