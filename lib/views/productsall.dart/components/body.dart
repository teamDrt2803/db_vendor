import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/modals/modals.dart';

import 'package:db_vendor/helpers/default_button.dart';
import 'package:db_vendor/helpers/constants.dart';

import 'package:db_vendor/modals/size_config.dart';
import 'package:db_vendor/views/productsall.dart/components/productwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  final WooController controller = Get.find();
  int catId;

  Body({Key key, this.catId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Flexible(
            child: controller.fetchingProducts.value ||
                    controller.fetchingProductsCat.value
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
                          : controller.allProductsCat.length,
                      itemBuilder: (context, index) {
                        Products products = catId == null
                            ? controller.allProducts[index]
                            : controller.allProductsCat[index];
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
                  Obx(
                    () => SizedBox(
                      width: SizeConfig.screenWidth * 0.4,
                      child: DefaultButton(
                        color: kSecondaryColor.withOpacity(0.5),
                        //width: getProportionateScreenWidth(20),
                        text: 'Previous',
                        press: catId == null
                            ? controller.firstProduct.value
                                ? null
                                : () {
                                    controller.getAllProducts(true, false);
                                  }
                            : controller.firstProductCat.value
                                ? null
                                : () {
                                    controller.getAllProductsCat(true, catId);
                                  },
                        //color: kPrimaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.4,
                    child: DefaultButton(
                      //width: getProportionateScreenWidth(20),
                      text: 'Next',
                      press: catId == null
                          ? controller.lastProduct.value
                              ? null
                              : () {
                                  controller.getAllProducts(false, false);
                                }
                          : controller.lastProductCat.value
                              ? null
                              : () {
                                  controller.getAllProductsCat(false, catId);
                                },
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
