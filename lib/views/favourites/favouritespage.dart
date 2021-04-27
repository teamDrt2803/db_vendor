import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/helpers/product_card.dart';
import 'package:db_vendor/main.dart';
import 'package:db_vendor/modals/favorites.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:db_vendor/views/home/components/drawer.dart';
import 'package:db_vendor/views/productsall.dart/components/productwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  FavouritesController _favouritesController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Custdrawer(),
      appBar: AppBar(
        title: Text('Favourites'),
      ),
      body: Container(
          margin: EdgeInsets.all(16.0),
          child: Obx(
            () => StaggeredGridView.extentBuilder(
              physics: BouncingScrollPhysics(),
              itemCount: _favouritesController.favouriteProducts.length,
              itemBuilder: (context, index) {
                print("size" +
                    _favouritesController.favouriteProducts.length.toString());
                var product = _favouritesController.favouriteProducts[index];
                return AllProductWidget(products: product);
              },
              maxCrossAxisExtent: 200,
              crossAxisSpacing: getProportionateScreenHeight(20),
              mainAxisSpacing: getProportionateScreenWidth(20),
              staggeredTileBuilder: (int index) {
                return StaggeredTile.extent(1, 250);
              },
            ),
          )),
    );
  }
}
