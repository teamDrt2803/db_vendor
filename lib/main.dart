import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/modals/favorites.dart';

import 'package:db_vendor/modals/modals.dart';

import 'package:db_vendor/views/splashScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';

import 'helpers/helpers.dart';
import 'modals/routes.dart';
import 'modals/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

Box<CartModal> box;
Box<AddressModal> addressBox;
Box<FavouriteProduct> favouritesBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Hive.registerAdapter<CartModal>(CartModalAdapter());
  Hive.registerAdapter<Products>(ProductsAdapter());
  Hive.registerAdapter<Images>(ImagesAdapter());
  Hive.registerAdapter<FavouriteProduct>(FavouriteProductAdapter());
  Hive.registerAdapter<AddressModal>(AddressModalAdapter());
  await Hive.initFlutter();
  box = await Hive.openBox<CartModal>('cart');
  addressBox = await Hive.openBox<AddressModal>('address');
  favouritesBox = await Hive.openBox<FavouriteProduct>('favourites');
  runApp(
    Phoenix(
      child: GetMaterialApp(
        initialBinding: InitialBindings(),
        debugShowCheckedModeBanner: false,
        title: Consts.app_name,
        theme: theme(),
        initialRoute: Splash.routeName,
        routes: routes,
      ),
    ),
  );
}
