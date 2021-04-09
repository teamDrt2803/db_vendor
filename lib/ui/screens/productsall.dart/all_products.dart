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

class AllProducts extends StatefulWidget {
  final int catId;

  const AllProducts({Key key, this.catId}) : super(key: key);
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  WooController _wooController = Get.find();

  @override
  void initState() {
    if (widget.catId == null) {
      _wooController.getAllProducts(false);
    } else {
      print('object');
      _wooController.getAllProductsCat(false, widget.catId);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
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
