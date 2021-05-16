import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/helpers/custappbar.dart';
import 'package:db_vendor/modals/modals.dart';
import 'package:db_vendor/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../main.dart';
import 'components/body.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'components/drawer.dart';
import 'components/icon_btn_with_counter.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final ProductController _productController = Get.find();
  static String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        key: _globalKey,
        drawer: Custdrawer(),
        appBar: CustAppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
            ),
            onPressed: () {
              _globalKey.currentState.openDrawer();
            },
          ),
          title: Text('Discount Bazaar'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ValueListenableBuilder<Box<CartModal>>(
              //   valueListenable: box.listenable(),
              //   builder: (context, Box<CartModal> cart, _) {
              //     return Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: IconBtnWithCounter(
              //         svgSrc: 'assets/icons/Cart Icon.svg',
              //         numOfitem: cart.length,
              //         press: () => Get.to(
              //           () => CartScreen(),
              //           transition: Transition.cupertino,
              //         ),
              //       ),
              //     );
              //   },
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: IconBtnWithCounter(
                  svgSrc: 'assets/icons/Bell.svg',
                  numOfitem: 3,
                  press: () {
                    Get.to(
                      () => NotificationsPage(),
                      transition: Transition.cupertino,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        body: Body(
          scrollController: _productController.scrollController,
        ),
      ),
    );
  }
}
