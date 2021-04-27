import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_vendor/modals/categoriesmodal.dart';
import 'package:db_vendor/modals/categorymodal.dart';
import 'package:db_vendor/views/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modals/size_config.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final CategoryModal product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () {
            print(product.id);
            Get.to(
              () => AllProducts(
                catId: product.id,
              ),
            );
          },
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "\₹${product.price}",
              //       style: TextStyle(
              //         fontSize: getProportionateScreenWidth(18),
              //         fontWeight: FontWeight.w600,
              //         color: kPrimaryColor,
              //       ),
              //     ),
              //     // InkWell(
              //     //   borderRadius: BorderRadius.circular(50),
              //     //   onTap: () {},
              //     //   child: Container(
              //     //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
              //     //     height: getProportionateScreenWidth(28),
              //     //     width: getProportionateScreenWidth(28),
              //     //     decoration: BoxDecoration(
              //     //       color: product.
              //     //           ? kPrimaryColor.withOpacity(0.15)
              //     //           : kSecondaryColor.withOpacity(0.1),
              //     //       shape: BoxShape.circle,
              //     //     ),
              //     //     child: SvgPicture.asset(
              //     //       "assets/icons/Heart Icon_2.svg",
              //     //       color: product.isFavourite
              //     //           ? Color(0xFFFF4848)
              //     //           : Color(0xFFDBDEE4),
              //     //     ),
              //     //   ),
              //     // ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
