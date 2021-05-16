import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/helpers/categorycard.dart';
import 'package:db_vendor/modals/categorymodal.dart';
import 'package:db_vendor/modals/size_config.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:db_vendor/views/views.dart';

import 'section_title.dart';

class PopularCategories extends StatelessWidget {
  final ProductController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
              title: 'Popular Categories',
              press: () {
                Get.to(() => AllCategories());
              }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...List.generate(
                  _controller.categories.length,
                  (index) {
                    var wooProducts = _controller.categories[index];
                    return wooProducts.images.first == null
                        ? SizedBox.shrink()
                        : CategoryCard(product: wooProducts);
                    // here by default width and height is 0
                  },
                ),
                //SizedBox(width: getProportionateScreenWidth(20)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
