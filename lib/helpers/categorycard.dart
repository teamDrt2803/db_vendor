import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/modals/categorymodal.dart';
import 'package:db_vendor/views/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
      padding: EdgeInsets.only(left: (20)),
      child: SizedBox(
        width: (width),
        child: GestureDetector(
          onTap: () {
            debugPrint(product.id.toString());
            Get.to(
              () => AllProducts(
                catId: product.id,
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: aspectRetio,
                child: Container(
                  padding: EdgeInsets.all((20)),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: kSecondaryColor.withOpacity(0.2),
                        offset: Offset(0, 5),
                        blurRadius: 16,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: CachedNetworkImage(imageUrl: product.images.first.src),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.name,
                style: GoogleFonts.roboto(
                  // color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
