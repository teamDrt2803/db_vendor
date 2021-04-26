import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/modals/modals.dart';
import 'package:db_vendor/modals/size_config.dart';

import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  CartCard({
    Key key,
    this.decrement,
    this.increment,
    @required this.cart,
  }) : super(key: key);

  final CartModal cart;
  void Function() increment;
  void Function() decrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child:
                  CachedNetworkImage(imageUrl: cart.wooProducts.images[0].src),
            ),
          ),
        ),
        SizedBox(width: 20),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.wooProducts.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text.rich(
                      TextSpan(
                        text: "\₹${cart.wooProducts.salesPrice}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: kPrimaryColor),
                        children: [
                          TextSpan(
                              text: " x${cart.totalQuantity}",
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          cart.totalQuantity == 1 ? Icons.delete : Icons.remove,
                          color: kPrimaryColor,
                        ),
                        onPressed: decrement,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color: kPrimaryColor,
                        ),
                        onPressed: increment,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
