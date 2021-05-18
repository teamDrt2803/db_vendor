import 'package:db_vendor/helpers/default_button.dart';
import 'package:db_vendor/views/categoryselector.dart';
import 'package:flutter/material.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:get/get.dart';

// This is the best practice
import '../components/splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      'title': 'Welcome to \nDiscount Bazaar',
      'text':
          'MP’s leading online wholesale platform for Small & Medium Businesses and Shop owners.',
      'image': 'assets/images/splash_1.png'
    },
    {
      'title': 'Wide Range \nOf Products',
      'text':
          'We offer wide range of products and categories available at the lowest possible rates.',
      'image': 'assets/images/splash_3.png'
    },
    {
      'title': 'Fast Delivery',
      'text': 'We strive for next day delivery of goods at your doorstep.',
      'image': 'assets/images/splash_4.png'
    },
    {
      'title': 'Easy Return',
      'text': 'We have a hassle free returns policy.',
      'image': 'assets/images/splash_2.png'
    },
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]['image'],
                  heading: splashData[index]['title'],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: 'Continue',
                      press: () {
                        Get.off(() => CategorySelector());
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
