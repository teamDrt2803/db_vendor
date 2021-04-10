import 'package:db_vendor/ui/screens/home/components/popular_categories.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            //HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            Categories(),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            DBPopularProducts(
              first: 'Offer',
              title: "My Discount Bazaar Products",
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            DBPopularProducts(
              first: 'Trader',
              title: "Top RMC yard Traders",
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            DBPopularProducts(
              first: 'Brand',
              title: "Top Brands of the Day",
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularCategories(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
