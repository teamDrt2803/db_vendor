import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/modals/favorites.dart';

import 'package:db_vendor/modals/modals.dart';
import 'package:db_vendor/modals/notification.dart';

import 'package:db_vendor/views/splashScreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';

import 'helpers/helpers.dart';
import 'helpers/routes.dart';
import 'modals/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

Box<FavouriteProduct> favouritesBox;
Box<NotificationData> notificationBox;
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (!Hive.isAdapterRegistered(20)) {
    Hive.registerAdapter<NotificationData>(
      NotificationDataAdapter(),
    );
  }
  await Hive.initFlutter();
  var box = await Hive.openBox<NotificationData>('notifications');
  var not = NotificationData.fromMap(message.data);
  if (!box.values.toList().any((element) => element.orderId == not.orderId)) {
    await box.add(not);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Hive.registerAdapter<Products>(ProductsAdapter());
  Hive.registerAdapter<Images>(ImagesAdapter());
  Hive.registerAdapter<FavouriteProduct>(FavouriteProductAdapter());
  Hive.registerAdapter<NotificationData>(NotificationDataAdapter());
  await Hive.initFlutter();
  await AwesomeNotifications().initialize('resource://mipmap/ic_launcher', [
    NotificationChannel(
        channelName: 'Orders',
        channelDescription: 'Shows order updates',
        channelKey: 'KeyOrders1234567890',
        importance: NotificationImportance.High)
  ]);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await GetStorage.init();
  favouritesBox = await Hive.openBox<FavouriteProduct>('favourites');
  notificationBox = await Hive.openBox<NotificationData>('notifications');
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
