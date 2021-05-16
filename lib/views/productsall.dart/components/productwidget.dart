import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/modals/modals.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:db_vendor/views/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class AllProductWidget extends StatelessWidget {
  AllProductWidget({
    Key key,
    @required this.products,
  }) : super(key: key);

  final Products products;
  // final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (products.images.isNotEmpty) {
          Get.to(
            () => DetailsScreen(),
            arguments: ProductDetailsArguments(product: products),
          );
        }
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
                    child: products.images.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: products.images.first.src)
                        : Icon(
                            Icons.shopping_cart,
                            color: Colors.redAccent,
                          ),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    //color: Colors.black,
                    child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                products.name,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SmoothStarRating(
                                color: kPrimaryColor,
                                borderColor: kPrimaryColor,
                                defaultIconData: Icons.star_outline,
                                //isReadOnly: true,
                                starCount: 5,
                                rating: double.parse(
                                  products.rating.toString(),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            left: 10,
                            bottom: 10,
                            child: Row(
                              children: [
                                // Text(
                                //   '\₹${products.onSale ? products.salePrice.isEmpty ? products.price : products.salePrice : products.price}',
                                //   style: GoogleFonts.openSans(
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: getProportionateScreenWidth(
                                //       16,
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  width: getProportionateScreenWidth(10),
                                ),
                                if (products.onSale == 'true' &&
                                    products.regularPrice.toString().isNotEmpty)
                                  Text(
                                    '\₹${products.regularPrice}',
                                    style: GoogleFonts.openSans(
                                      color: kSecondaryColor.withOpacity(0.5),
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.bold,
                                      fontSize: getProportionateScreenWidth(
                                        16,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: -20,
                            child: RawMaterialButton(
                              onPressed: () {
                                // _cartController.addToCart(products: products);
                              },
                              fillColor: kPrimaryColor,
                              constraints: BoxConstraints(
                                minHeight: getProportionateScreenHeight(40),
                                minWidth: getProportionateScreenWidth(40),
                                maxHeight: getProportionateScreenHeight(40),
                                maxWidth: getProportionateScreenWidth(40),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            if (products.salesPrice.toString().isNotEmpty &&
                products.onSale == 'true')
              Align(
                alignment: Alignment.topRight,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    child: Text(
                      'Sale',
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
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
