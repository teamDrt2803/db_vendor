import 'dart:ui';

import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/main.dart';
import 'package:db_vendor/modals/modals.dart' as modal;

import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import 'cart_card.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container();
    // return ValueListenableBuilder<Box<modal.CartModal>>(
    //     valueListenable: box.listenable(),
    //     builder: (context, box, _) {
    //       if (box.length > 0) {
    //         List<modal.CartModal> cartList = box.values.toList();
    //         return Padding(
    //           padding: EdgeInsets.symmetric(
    //               horizontal: getProportionateScreenWidth(20)),
    //           child: ListView.builder(
    //             physics: BouncingScrollPhysics(),
    //             itemCount: cartList.length,
    //             itemBuilder: (context, index) => Padding(
    //               padding: EdgeInsets.symmetric(vertical: 10),
    //               child: Dismissible(
    //                 key: Key(cartList[index].wooProducts.id.toString()),
    //                 direction: DismissDirection.endToStart,
    //                 onDismissed: (direction) {
    //                   ///TODO:Delete from cart
    //                   // cartController.deleteCartItem(index);
    //                   // setState(() {
    //                   //   demoCarts.removeAt(index);
    //                   // });
    //                 },
    //                 background: Container(
    //                   padding: EdgeInsets.symmetric(horizontal: 20),
    //                   decoration: BoxDecoration(
    //                     color: Color(0xFFFFE6E6),
    //                     borderRadius: BorderRadius.circular(15),
    //                   ),
    //                   child: Row(
    //                     children: [
    //                       Spacer(),
    //                       SvgPicture.asset("assets/icons/Trash.svg"),
    //                     ],
    //                   ),
    //                 ),
    //                 child: CartCard(
    //                   cart: cartList[index],
    //                   increment: () {
    ///TODO:INcrement
    //                     // cartController.incrementCart(index, cartList[index]);
    //                   },
    //                   decrement: () {
    //                     if (cartList[index].totalQuantity == 1) {
    ///TODO:DElete cart ite,
    //                       // cartController.deleteCartItem(index);
    //                     } else {
    ///TODO: devrement cart item
    //                       // cartController.decrementCart(index, cartList[index]);
    //                     }
    //                   },
    //                 ),
    //               ),
    //             ),
    //           ),
    //         );
    //       } else {
    //         return Container(
    //           child: Center(
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Image.asset("assets/images/empty_cart.png"),
    //                 Text(
    //                   'Oops :(\nYou Cart is Empty',
    //                   textAlign: TextAlign.center,
    //                   style: GoogleFonts.openSans(
    //                     color: kSecondaryColor,
    //                     fontSize: getProportionateScreenWidth(24),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(
    //                       horizontal: 48.0, vertical: 24.0),
    //                   child: ElevatedButton.icon(
    //                       style: ButtonStyle(
    //                           shape: MaterialStateProperty.all(
    //                               RoundedRectangleBorder(
    //                                   borderRadius: BorderRadius.circular(10))),
    //                           elevation: MaterialStateProperty.all(0),
    //                           minimumSize: MaterialStateProperty.all(Size(
    //                               SizeConfig.screenWidth * 0.7,
    //                               getProportionateScreenHeight(60))),
    //                           backgroundColor: MaterialStateProperty.all(
    //                               kPrimaryLightColor)),
    //                       icon: Icon(
    //                         Icons.arrow_back_ios_rounded,
    //                         color: kPrimaryColor,
    //                       ),
    //                       onPressed: () {
    //                         Get.back();
    //                       },
    //                       label: Text(
    //                         "Back to Shop",
    //                         style: TextStyle(
    //                             color: kPrimaryColor,
    //                             fontWeight: FontWeight.w600,
    //                             fontSize: 20),
    //                       )),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         );
    //       }
    //     });
  }
}
