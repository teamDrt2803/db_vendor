import 'package:db_vendor/modals/size_config.dart';
import 'package:db_vendor/views/home/components/popular_categories.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  final ScrollController scrollController;

  const Body({Key key, this.scrollController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SingleChildScrollView(
        controller: scrollController,
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: (30)),
            DiscountBanner(),
            Categories(),
            SpecialOffers(),
            SizedBox(height: (30)),
            PopularProducts(),
            SizedBox(height: (30)),
            PopularCategories(),
            if (kProfileMode) ...[
              SizedBox(height: (30)),
              DBPopularProducts(
                  first: 'Offer', title: 'My Discount Bazaar Products'),
              SizedBox(height: (30)),
              DBPopularProducts(first: 'Trader', title: 'Top RMC yard Traders'),
              SizedBox(height: (30)),
              DBPopularProducts(first: 'Brand', title: 'Top Brands of the Day'),
              SizedBox(height: (30)),
            ]
          ],
        ),
      ),
    );
  }
}
