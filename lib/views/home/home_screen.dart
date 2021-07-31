import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/helpers/custappbar.dart';
import 'package:db_vendor/main.dart';
import 'package:db_vendor/modals/notification.dart';
import 'package:db_vendor/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'components/categories.dart';
import 'components/discount_banner.dart';
import 'components/icon_btn_with_counter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'components/popular_categories.dart';
import 'components/popular_product.dart';
import 'components/special_offers.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final ProductController _productController = Get.find();
  final CartController _cartController = Get.find();
  static String routeName = '/home';
  final List<Widget> widgets = [
    SizedBox(height: 10),
    DiscountBanner(),
    Categories(),
    SpecialOffers(),
    SizedBox(height: 30),
    PopularProducts(),
    SizedBox(height: 30),
    PopularCategories(),
    // if (kProfileMode) ...[
    //   SizedBox(height: 30),
    //   DBPopularProducts(first: 'Offer', title: 'My Discount Bazaar Products'),
    //   SizedBox(height: 30),
    //   DBPopularProducts(first: 'Trader', title: 'Top RMC yard Traders'),
    //   SizedBox(height: 30),
    //   DBPopularProducts(first: 'Brand', title: 'Top Brands of the Day'),
    //   SizedBox(height: 30),
    // ],
  ];
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
            key: _globalKey,
            appBar: CustAppBar(
                title: Text('Discount Bazaar'),
                trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                  Obx(() => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconBtnWithCounter(
                          svgSrc: 'assets/icons/Cart Icon.svg',
                          numOfitem: _cartController.cartItems.length,
                          press: () => Get.to(() => CartScreen(),
                              transition: Transition.cupertino)))),
                  Flexible(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          child: ValueListenableBuilder<Box<NotificationData>>(
                              valueListenable: notificationBox.listenable(),
                              builder: (context, snapshot, _) {
                                return IconBtnWithCounter(
                                    svgSrc: 'assets/icons/Bell.svg',
                                    numOfitem: snapshot.length,
                                    press: () => Get.to(
                                        () => NotificationsPage(),
                                        transition: Transition.cupertino));
                              })))
                ])),
            body: SafeArea(
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: _productController.scrollController,
                    itemCount: widgets.length,
                    itemBuilder: (context, index) => widgets[index]))));
  }
}
