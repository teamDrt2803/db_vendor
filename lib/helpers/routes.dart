import 'package:db_vendor/views/coupons.dart';
import 'package:db_vendor/views/mainscreen/mainscreen.dart';
import 'package:db_vendor/views/views.dart';
import 'package:db_vendor/views/splashScreen.dart';
import 'package:flutter/widgets.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  CouponsScreen.routesName: (context) => CouponsScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  Splash.routeName: (context) => Splash(),
  MainScreen.routeName: (context) => MainScreen(),
};
