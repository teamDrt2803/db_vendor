import 'package:db_vendor/Authorization/controllers/woocontroller.dart';
import 'package:db_vendor/productsmodal.dart';
import 'package:flutter/material.dart';
import 'package:db_vendor/ui/components/product_card.dart';
import 'package:db_vendor/ui/models/Product.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  WooController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => Row(
              children: [
                ...List.generate(
                  _controller.topProducts.length,
                  (index) {
                    WooProducts wooProducts = _controller.topProducts[index];
                    return ProductCard(product: wooProducts);
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
