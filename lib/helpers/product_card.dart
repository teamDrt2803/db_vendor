import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_vendor/modals/modals.dart';
import 'package:flutter/material.dart';
import 'package:db_vendor/views/views.dart';

import 'constants.dart';
import '../modals/size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: product),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: product.id.toString(),
                    child:
                        CachedNetworkImage(imageUrl: product.images.first.src),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.name,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\₹${product.salesPrice}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              )
            ],
          ),
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
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        height: getProportionateScreenHeight(180),
        child: GestureDetector(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Color(0xfff5f6f9),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    //width: getProportionateScreenWidth(100),
                    height: getProportionateScreenHeight(100),
                    child: Container(
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Hero(
                          tag: product.id.toString(),
                          child: Icon(
                            Icons.verified_outlined,
                            size: 96,
                            color: kPrimaryColor,
                          )
                          // child: CachedNetworkImage(
                          //     imageUrl: product.images.first.src),
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
                      fontSize: getProportionateScreenWidth(18),
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
