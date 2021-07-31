import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: (130),
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage('assets/images/stay_home.png')),
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
