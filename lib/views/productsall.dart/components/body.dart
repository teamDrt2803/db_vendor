import 'package:db_vendor/controllers/controllers.dart';

import 'package:db_vendor/helpers/default_button.dart';
import 'package:db_vendor/helpers/constants.dart';

import 'package:db_vendor/modals/size_config.dart';
import 'package:db_vendor/views/productsall.dart/components/productwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  final ProductController controller = Get.find();
  int catId;

  Body({Key key, this.catId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Flexible(
            child: controller.allProducts.isEmpty || controller.fetching.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    //color: kSecondaryColor.withOpacity(0.2),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: StaggeredGridView.extentBuilder(
                      physics: BouncingScrollPhysics(),
                      itemCount: catId == null
                          ? controller.allProducts.length
                          : controller.allProducts.length,
                      itemBuilder: (context, index) {
                        var products = catId == null
                            ? controller.allProducts[index]
                            : controller.allProducts[index];
                        return AllProductWidget(products: products);
                      },
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: getProportionateScreenHeight(20),
                      mainAxisSpacing: getProportionateScreenWidth(20),
                      staggeredTileBuilder: (int index) {
                        return StaggeredTile.extent(1, 300);
                      },
                    ),
                  ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(70),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.4,
                    child: DefaultButton(
                      color: kSecondaryColor.withOpacity(0.5),

                      text: 'Previous',

                      press: controller.currentProductPage.value == 0
                          ? null
                          : () {
                              controller.getPreviousProducts();
                            },
                      //color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.4,
                    child: DefaultButton(
                      text: 'Next',
                      press: controller.hasNext.value
                          ? () {
                              if (!controller.fetching.value) {
                                controller.getNextProducts();
                              }
                            }
                          : null,
                      //color: kPrimaryColor,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
