import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_vendor/controllers/cartcontroller.dart';
import 'package:db_vendor/main.dart';
import 'package:db_vendor/modals/modals.dart';

import 'package:db_vendor/helpers/default_button.dart';
import 'package:db_vendor/helpers/constants.dart';

import 'package:db_vendor/views/views.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  final double total;
  final database = FirebaseDatabase.instance.reference();
  final auth = FirebaseAuth.instance.currentUser;
  // final CartController _cartController = Get.find();
  final int selectedIndex = 0;
  bool addressSet = false;
  Body({Key key, this.total}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // AddressModal modal =
    //     addressBox.length > 0 ? addressBox.getAt(selectedIndex) : null;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: SizeConfig.screenHeight * 0.25,
                width: double.infinity,
                color: kPrimaryColor,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Checkout',
                      style: GoogleFonts.openSans(
                          fontSize: getProportionateScreenWidth(
                            40,
                          ),
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  width: double.infinity,
                  color: Color(
                    0xfff5f6f9,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 96.0, left: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Order',
                          style: GoogleFonts.openSans(
                            fontSize: getProportionateScreenWidth(30),
                            fontWeight: FontWeight.bold,
                            color: Color(
                              0xff212223,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        // SizedBox(
                        //   height: SizeConfig.screenHeight * 0.35,
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(right: 24.0),
                        //     child: Card(
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //       shadowColor: Color(
                        //         0xfff5f6f9,
                        //       ),
                        //       elevation: 5.0,
                        //       child: ValueListenableBuilder<Box<CartModal>>(
                        //         valueListenable: box.listenable(),
                        //         builder: (context, box, _) {
                        //           return Column(
                        //             mainAxisSize: MainAxisSize.min,
                        //             children: [
                        //               Expanded(
                        //                 child: ListView.builder(
                        //                   itemCount: box.length,
                        //                   shrinkWrap: true,
                        //                   physics: BouncingScrollPhysics(),
                        //                   itemBuilder: (context, index) {
                        //                     CartModal modal = box.getAt(index);
                        //                     return ListTile(
                        //                       leading: SizedBox(
                        //                         height:
                        //                             getProportionateScreenHeight(
                        //                                 50),
                        //                         width:
                        //                             getProportionateScreenWidth(
                        //                                 50),
                        //                         child: CachedNetworkImage(
                        //                           imageUrl: modal.wooProducts
                        //                               .images.first.src,
                        //                         ),
                        //                       ),
                        //                       title: Text(
                        //                         modal.wooProducts.name,
                        //                       ),
                        //                       trailing: Text(
                        //                         modal.totalQuantity.toString(),
                        //                       ),
                        //                     );
                        //                   },
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: const EdgeInsets.symmetric(
                        //                   horizontal: 16.0,
                        //                 ),
                        //                 child: Divider(
                        //                   thickness: 1.0,
                        //                   color: Color(0xff212223).withOpacity(
                        //                     0.2,
                        //                   ),
                        //                 ),
                        //               ),
                        //               ListTile(
                        //                 title: Text(
                        //                   'Total',
                        //                   style: GoogleFonts.openSans(
                        //                     color: Color(
                        //                       0xff212223,
                        //                     ),
                        //                     fontSize:
                        //                         getProportionateScreenWidth(
                        //                       20,
                        //                     ),
                        //                     fontWeight: FontWeight.bold,
                        //                   ),
                        //                 ),
                        //                 trailing: Text(
                        //                   '₹$total',
                        //                   style: GoogleFonts.openSans(
                        //                     color: Color(
                        //                       0xff212223,
                        //                     ),
                        //                     fontSize:
                        //                         getProportionateScreenWidth(
                        //                       20,
                        //                     ),
                        //                     fontWeight: FontWeight.w500,
                        //                     fontStyle: FontStyle.italic,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ],
                        //           );
                        //         },
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Text(
                          'Payments',
                          style: GoogleFonts.openSans(
                            fontSize: getProportionateScreenWidth(30),
                            fontWeight: FontWeight.bold,
                            color: Color(
                              0xff212223,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              shadowColor: Color(
                                0xfff5f6f9,
                              ),
                              elevation: 5.0,
                              child: Center(
                                child: ListTile(
                                  title: Text(
                                    "COD",
                                    style: GoogleFonts.openSans(
                                      color: Color(0xff212223),
                                    ),
                                  ),
                                  trailing: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Change',
                                      style: GoogleFonts.openSans(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        // ValueListenableBuilder<Box<CartModal>>(
                        //     valueListenable: box.listenable(),
                        //     builder: (context, sboxnapshot, _) {
                        //       return Padding(
                        //         padding: const EdgeInsets.only(right: 24.0),
                        //         child: Obx(
                        //           () => DefaultButton(
                        //             widget: _cartController.uploading.value
                        //                 ? Center(
                        //                     child: CircularProgressIndicator(
                        //                       valueColor:
                        //                           AlwaysStoppedAnimation(
                        //                               Colors.white),
                        //                     ),
                        //                   )
                        //                 : null,
                        //             text: 'Confirm Order',
                        //             press: () async {
                        //               if (addressSet) {
                        //                 await _cartController.confirmOrder();
                        //                 Get.to(() => OrderPlacedScreen());
                        //               } else {
                        //                 Get.dialog(AlertDialog(
                        //                   title: Text('Please Set an Address'),
                        //                   content: Text(
                        //                       'Add an address for the product to be delivered!'),
                        //                   actions: [
                        //                     TextButton(
                        //                       onPressed: () {
                        //                         Get.back();
                        //                       },
                        //                       child: Text('OKAY'),
                        //                     )
                        //                   ],
                        //                 ));
                        //               }
                        //             },
                        //           ),
                        //         ),
                        //       );
                        //     }),
                        SizedBox(
                          height: getProportionateScreenHeight(80),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: SizeConfig.screenHeight * 0.25 - 40.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(36)),
              child: Card(
                child: Column(
                  children: [
                    ValueListenableBuilder<Box<AddressModal>>(
                        valueListenable: addressBox.listenable(),
                        builder: (context, box, _) {
                          addressSet = box.length > 0;
                          AddressModal modal =
                              box.length > 0 ? box.getAt(selectedIndex) : null;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Icon(
                                Icons.location_on_outlined,
                                color: Colors.redAccent,
                              ),
                              title: Text(
                                addressBox.length > 0
                                    ? '${modal.houseNo},${modal.appartmentName} ${modal.streetName} ${modal.landMark}'
                                    : 'No Address',
                              ),
                              trailing: TextButton(
                                onPressed: () {
                                  Get.to(() => AddressScreen());
                                },
                                child: Text(box.length > 1 ? 'Change' : 'Add'),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
