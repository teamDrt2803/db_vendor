import 'package:another_flushbar/flushbar_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:db_vendor/main.dart';
import 'package:db_vendor/modals/favorites.dart';
import 'package:db_vendor/modals/productsmodal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavouritesController extends GetxController {
  var firestore = FirebaseFirestore.instance;
  RxList<Products> favouriteProducts = <Products>[].obs;
  @override
  void onInit() {
    getFirstTime();
    getdata();
    super.onInit();
  }

  void updateFavourites(dynamic id, BuildContext context) {
    var index =
        favouritesBox.values.toList().indexWhere((element) => element.id == id);
    if (index == -1) {
      FlushbarHelper.createInformation(message: 'Added to favourites')
          .show(context);
      favouritesBox.add(FavouriteProduct(id: id));
    } else {
      FlushbarHelper.createInformation(message: 'Removed to favourites')
          .show(context);
      favouritesBox.deleteAt(index);
    }
  }

  void getdata() {
    debugPrint('object');
    favouritesBox.listenable().addListener(() async {
      debugPrint('object');
      favouriteProducts.clear();
      var fav = favouritesBox.values.toList().map((e) => e.id).toList();
      for (var item in fav) {
        var snsapshhot = await firestore
            .collection('products')
            .where('id', isEqualTo: item)
            .get();
        for (var item in snsapshhot.docs) {
          if (!favouriteProducts
              .any((element) => element.id == item.data()['id'])) {
            favouriteProducts.add(Products.fromJson(item.data()));
          }
        }
      }
    });
  }

  void getFirstTime() async {
    favouriteProducts.clear();
    var fav = favouritesBox.values.toList().map((e) => e.id).toList();
    for (var item in fav) {
      var snsapshhot = await firestore
          .collection('products')
          .where('id', isEqualTo: item)
          .get();
      for (var item in snsapshhot.docs) {
        if (!favouriteProducts
            .any((element) => element.id == item.data()['id'])) {
          favouriteProducts.add(Products.fromJson(item.data()));
        }
      }
    }
  }
}
