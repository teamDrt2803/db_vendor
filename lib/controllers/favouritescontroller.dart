import 'package:db_vendor/main.dart';
import 'package:db_vendor/modals/favorites.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FavouritesController extends GetxController {
  updateFavourites(dynamic id, BuildContext context) {
    var index =
        favouritesBox.values.toList().indexWhere((element) => element.id == id);

    if (index == -1) {
      Get.snackbar('Added to Favourites', '');
      favouritesBox.add(new FavouriteProduct(id: id));
    } else {
      Get.snackbar('Removed from Favourites', '');
      favouritesBox.deleteAt(index);
    }
  }
}
