import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_vendor/modals/categoriesmodal.dart';
import 'package:db_vendor/modals/size_config.dart';

import 'package:flutter/material.dart';

class CategoryImages extends StatefulWidget {
  const CategoryImages({
    Key key,
    @required this.product,
  }) : super(key: key);

  final WooCategories product;

  @override
  _CategoryImagesState createState() => _CategoryImagesState();
}

class _CategoryImagesState extends State<CategoryImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.product.id.toString(),
              child: CachedNetworkImage(imageUrl: widget.product.image.src),
            ),
          ),
        ),
      ],
    );
  }
}
