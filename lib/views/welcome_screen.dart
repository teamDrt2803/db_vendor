import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:db_vendor/widgets/page_view_indicator.dart';
import 'package:db_vendor/widgets/primary_button.dart';
import 'package:db_vendor/widgets/splash_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'views.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: Scaffold(
        bottomSheet: Container(
          height: 200,
          color: Colors.white,
          child: Center(
            child: PrimaryButton(
              text: 'Skip',
              onPressed: () => Get.off(() => CategorySelector()),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(height: 25),
                Expanded(
                    flex: 4,
                    child: PageView.builder(
                        physics: BouncingScrollPhysics(),
                        onPageChanged: (value) =>
                            setState(() => currentPage = value),
                        itemCount: splashData.length,
                        itemBuilder: (context, index) => SplashContent(
                            image: splashData[index]['image'],
                            heading: splashData[index]['title'],
                            text: splashData[index]['text']))),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        splashData.length,
                        (index) =>
                            PageViewIndicator(selected: currentPage == index))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
