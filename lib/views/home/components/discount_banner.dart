import 'package:db_vendor/modals/size_config.dart';
import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      height: getProportionateScreenHeight(130),
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage('assets/images/stay_home.png')),
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
