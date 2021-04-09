import 'package:db_vendor/Authorization/controllers/woocontroller.dart';
import 'package:db_vendor/productsmodal.dart';
import 'package:db_vendor/ui/components/default_button.dart';
import 'package:db_vendor/ui/constants.dart';
import 'package:db_vendor/ui/screens/productsall.dart/components/productwidget.dart';
import 'package:db_vendor/ui/size_config.dart';
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
                : Obx(
                    () => Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: StaggeredGridView.extentBuilder(
                        physics: BouncingScrollPhysics(),
                        itemCount: catId == null
                            ? controller.allProducts.length
                            : controller.allProductsCat.length,
                        itemBuilder: (context, index) {
                          WooProducts products = catId == null
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
                        press: controller.firstProduct.value
                            ? null
                            : () {
                                catId == null
                                    ? controller.getAllProducts(true)
                                    : controller.getAllProductsCat(true, catId);
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
                      press: () {
                        catId == null
                            ? controller.getAllProducts(false)
                            : controller.getAllProductsCat(false, catId);
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
