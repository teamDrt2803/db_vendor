import 'package:db_vendor/modals/categoriesmodal.dart';
import 'package:db_vendor/controllers/controllers.dart';

import 'package:db_vendor/modals/size_config.dart';
import 'package:db_vendor/views/allcategories/components/productwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  final WooController controller = Get.find();
  final int catId;

  Body({Key key, this.catId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Flexible(
            child: Container(
              //color: kSecondaryColor.withOpacity(0.2),
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: StaggeredGridView.extentBuilder(
                physics: BouncingScrollPhysics(),
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  WooCategories categories = controller.categories[index];
                  return AllCategoriesWidget(products: categories);
                },
                maxCrossAxisExtent: 200,
                crossAxisSpacing: getProportionateScreenHeight(20),
                mainAxisSpacing: getProportionateScreenWidth(20),
                staggeredTileBuilder: (int index) {
                  return StaggeredTile.extent(1, 200);
                },
              ),
            ),
          ),
          // SizedBox(
          //   height: getProportionateScreenHeight(70),
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(
          //       horizontal: 16,
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Obx(
          //           () => SizedBox(
          //             width: SizeConfig.screenWidth * 0.4,
          //             child: DefaultButton(
          //               color: kSecondaryColor.withOpacity(0.5),
          //               //width: getProportionateScreenWidth(20),
          //               text: 'Previous',
          //               press: catId == null
          //                   ? controller.firstProduct.value
          //                       ? null
          //                       : () {
          //                           controller.getAllProducts(true, false);
          //                         }
          //                   : controller.firstProductCat.value
          //                       ? null
          //                       : () {
          //                           controller.getAllProductsCat(true, catId);
          //                         },
          //               //color: kPrimaryColor,
          //             ),
          //           ),
          //         ),
          //         SizedBox(
          //           width: SizeConfig.screenWidth * 0.4,
          //           child: DefaultButton(
          //             //width: getProportionateScreenWidth(20),
          //             text: 'Next',
          //             press: catId == null
          //                 ? controller.lastProduct.value
          //                     ? null
          //                     : () {
          //                         controller.getAllProducts(false, false);
          //                       }
          //                 : controller.lastProductCat.value
          //                     ? null
          //                     : () {
          //                         controller.getAllProductsCat(false, catId);
          //                       },
          //             //color: kPrimaryColor,
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
