import 'package:cached_network_image/cached_network_image.dart';

import 'package:db_vendor/modals/categoriesmodal.dart';
import 'package:db_vendor/modals/size_config.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../views.dart';

class AllCategoriesWidget extends StatelessWidget {
  AllCategoriesWidget({
    Key key,
    @required this.products,
  }) : super(key: key);

  final WooCategories products;

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

// String _parseHtmlString(String htmlString) {
//   final document = parse(htmlString);
//   final String parsedString = parse(document.body.text).documentElement.text;

//   return parsedString;
// }
