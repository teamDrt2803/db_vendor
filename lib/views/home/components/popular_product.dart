import 'package:another_flushbar/flushbar_helper.dart';
import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/modals/modals.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:db_vendor/helpers/product_card.dart';
import 'package:get/get.dart';
import 'package:db_vendor/views/views.dart';

import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  final ProductController _controller = Get.find();
  final CartController _cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
              title: 'Popular Products',
              press: () {
                Get.to(() => AllProducts());
              }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          clipBehavior: Clip.none,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => Row(
              children: [
                ...List.generate(
                  _controller.products.length,
                  (index) {
                    var wooProducts = _controller.products[index];
                    return ProductCard(
                      product: wooProducts,
                      onPressed: () async {
                        var done = await _cartController.addCartItem(
                          CartModal(
                            totalQuantity: 1,
                            wooProducts: wooProducts,
                            time: ServerValue.timestamp,
                          ),
                        );
                        if (done) {
                          // ignore: unawaited_futures
                          FlushbarHelper.createInformation(
                                  message: '${wooProducts.name} added to cart')
                              .show(context);
                        } else {
                          // ignore: unawaited_futures
                          FlushbarHelper.createInformation(
                                  message:
                                      'PLease login first to add Items to cart')
                              .show(context);
                        }
                      },
                    );
                    // here by default width and height is 0
                  },
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class DBPopularProducts extends StatelessWidget {
  final ProductController _controller = Get.find();
  final String title, first;
  DBPopularProducts({Key key, this.title, this.first}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
              title: title,
              press: () {
                //Get.to(() => AllProducts());
              }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          clipBehavior: Clip.none,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => Row(
              children: [
                ...List.generate(
                  _controller.products.length,
                  (index) {
                    var wooProducts = _controller.products[index];
                    return DBProductCard(
                      product: wooProducts,
                      index: index + 1,
                      first: first,
                    );
                    // here by default width and height is 0
                  },
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
