import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/helpers/custappbar.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:db_vendor/views/home/components/drawer.dart';
import 'package:db_vendor/views/productsall.dart/components/productwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  final FavouritesController _favouritesController = Get.find();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Custdrawer(),
      appBar: CustAppBar(
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
            icon: Icon(Icons.menu)),
        title: Text('Favourites'),
      ),
      body: Container(
          margin: EdgeInsets.all(16.0),
          child: Obx(
            () => _favouritesController.favouriteProducts.isEmpty
                ? Container(
                    child: Center(
                      child: Text(
                        'Add some of your favourite products to view them here',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : StaggeredGridView.extentBuilder(
                    physics: BouncingScrollPhysics(),
                    itemCount: _favouritesController.favouriteProducts.length,
                    itemBuilder: (context, index) {
                      print('size' +
                          _favouritesController.favouriteProducts.length
                              .toString());
                      var product =
                          _favouritesController.favouriteProducts[index];
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
