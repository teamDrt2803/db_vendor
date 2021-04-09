import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_vendor/Authorization/controllers/cartcontroller.dart';
import 'package:db_vendor/Authorization/views/categoriesscreen.dart';
import 'package:db_vendor/categoriesmodal.dart';
import 'package:db_vendor/ui/components/default_button.dart';
import 'package:db_vendor/ui/constants.dart';
import 'package:db_vendor/ui/screens/categoryDetails/category_details.dart';
import 'package:db_vendor/ui/screens/details/details_screen.dart';
import 'package:db_vendor/ui/screens/productsall.dart/all_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../../productsmodal.dart';
import '../../../size_config.dart';

class AllCategoriesWidget extends StatelessWidget {
  AllCategoriesWidget({
    Key key,
    @required this.products,
  }) : super(key: key);

  final WooCategories products;
  final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => AllProducts(
            catId: products.id,
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  child: SizedBox(
                      height: getProportionateScreenHeight(130),
                      width: getProportionateScreenWidth(130),
                      child: products.image == null
                          ? Icon(
                              Icons.local_grocery_store,
                              size: 96,
                              color: Colors.redAccent,
                            )
                          : CachedNetworkImage(imageUrl: products.image.src)),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Text(
                        products.name.replaceAll('&amp;', ''),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String _parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body.text).documentElement.text;

  return parsedString;
}
