import 'package:db_vendor/Authorization/controllers/woocontroller.dart';
import 'package:db_vendor/orders/cartmodal.dart';
import 'package:db_vendor/ui/screens/cart/cart_screen.dart';
import 'package:db_vendor/ui/screens/home/components/icon_btn_with_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../main.dart';
import 'components/body.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AllCategories extends StatefulWidget {
  final int catId;

  const AllCategories({Key key, this.catId}) : super(key: key);
  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  WooController _wooController = Get.find();

  @override
  void initState() {
    print('object');
    _wooController.getCategories(pageCount: 100);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('All Categories'),
        backgroundColor: Colors.transparent,
        actions: [
          ValueListenableBuilder<Box<CartModal>>(
            valueListenable: box.listenable(),
            builder: (context, Box<CartModal> cart, _) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconBtnWithCounter(
                  svgSrc: "assets/icons/Cart Icon.svg",
                  numOfitem: cart.length,
                  press: () => Get.to(() => CartScreen()),
                ),
              );
            },
          ),
        ],
      ),
      body: Body(
        catId: widget.catId,
      ),
    );
  }
}