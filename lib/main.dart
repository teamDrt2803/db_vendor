import 'package:db_vendor/Authorization/bindings/initialbindings.dart';
import 'package:db_vendor/constants.dart';
import 'package:db_vendor/orders/cartmodal.dart';
import 'package:db_vendor/productsmodal.dart';
import 'package:db_vendor/ui/models/Address.dart';
import 'package:db_vendor/ui/screens/splashScreen.dart';

import 'package:db_vendor/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';

import 'ui/routes.dart';
import 'ui/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

Box<CartModal> box;
Box<AddressModal> addressBox;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Hive.registerAdapter<CartModal>(CartModalAdapter());
  Hive.registerAdapter<WooProducts>(WooProductsAdapter());
  Hive.registerAdapter<Dimensions>(DimensionsAdapter());
  Hive.registerAdapter<Images>(ImagesAdapter());
  Hive.registerAdapter<AddressModal>(AddressModalAdapter());
  await Hive.initFlutter();
  box = await Hive.openBox<CartModal>('cart');
  addressBox = await Hive.openBox<AddressModal>('address');
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
