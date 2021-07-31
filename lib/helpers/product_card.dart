import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_vendor/modals/modals.dart';
import 'package:flutter/material.dart';
import 'package:db_vendor/views/views.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'constants.dart';
import 'package:db_vendor/helpers/extensions.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.width = 140,
    this.onPressed,
    this.aspectRetio = 1.02,
    @required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Products product;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, DetailsScreen.routeName,
          arguments: ProductDetailsArguments(product: product)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        width: Get.width - 32,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: kSecondaryColor.withOpacity(0.2),
              blurRadius: 16,
              offset: Offset(1, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Hero(
              tag: product.id.toString(),
              child: Container(
                height: (150),
                width: (Get.width - 32) * 0.35,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(product.images.first.src),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: (10),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.fromLTRB(0.0, 8.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.openSans(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: (5)),
                    Text(
                      product.shortDescription.normalize(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: (10)),
                    Text(
                      product.salesPrice.toString().rupee(),
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SmoothStarRating(
                            color: kPrimaryColor,
                            borderColor: kPrimaryColor,
                            defaultIconData: Icons.star_outline,
                            isReadOnly: true,
                            starCount: 5,
                            rating: double.parse(
                              product.rating.toString(),
                            ),
                          ),
                          SizedBox(
                            width: (10),
                          ),
                          Flexible(
                            child: FloatingActionButton(
                              mini: true,
                              elevation: 1,
                              heroTag: ValueKey(product.id),
                              backgroundColor: kPrimaryColor,
                              tooltip: 'Add to cart',
                              onPressed: onPressed,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // RatingBar(ratingWidget: Ra, onRatingUpdate: onRatingUpdate)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DBProductCard extends StatelessWidget {
  const DBProductCard({
    Key key,
    this.width = 180,
    this.aspectRetio = 1.02,
    this.index,
    this.first,
    @required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Products product;
  final int index;
  final String first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: (20)),
      child: SizedBox(
        width: (width),
        height: (180),
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: kSecondaryColor.withOpacity(0.1),
                    offset: Offset(0, 3),
                    blurRadius: 14,
                  ),
                ],
                color: Color(0xfff5f6f9),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all((20)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    //width: (100),
                    height: (100),
                    child: Container(
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.verified_outlined,
                        size: 96,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Flexible(
                  child: Text(
                    '$first $index'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: (18),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      //color: Colors.black,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
