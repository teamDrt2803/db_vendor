import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/modals/modals.dart';

import 'package:db_vendor/views/views.dart';
import 'package:db_vendor/views/home/components/icon_btn_with_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../main.dart';
import 'components/body.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AllProducts extends StatefulWidget {
  final int catId;

  const AllProducts({Key key, this.catId}) : super(key: key);
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  ProductController _productController = Get.find();

  @override
  void initState() {
    _productController.currentProductPage.value = 0;
    if (widget.catId == null) {
      _productController.getAllProducts();
    } else {
      //_wooController.getAllProductsCat(false, widget.catId);
      _productController.getProductBYCategory(widget.catId.toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('All Products'),
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
