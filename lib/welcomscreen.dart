import 'package:db_vendor/Authorization/controllers/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  AuthController _authController = Get.find();
  Map<Permission, PermissionStatus> statuses;
  askPermission() async {
    statuses = await [
      Permission.camera,
      Permission.contacts,
      Permission.accessMediaLocation,
      Permission.storage,
    ].request();
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(30.0, 10.0),
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      globalBackgroundColor: Colors.white,
      showNextButton: true,
      next: Text("Next"),
      showSkipButton: true,
      skip: Text('Skip'),
      pages: [
        PageViewModel(
          image: Center(
            child: SafeArea(
              child: Image.asset('assets/gifs/inventory.jpg'),
            ),
          ),
          title: 'No Stress Inventory Management',
          body: 'Discount Bazaar Offers best ways to manage your inventories digitally.' +
              'You can keep track what you have and what you don\'t.\nEverything just a single Tap away!!',
        ),
        PageViewModel(
          image: Center(
            child: Image.asset(
              'assets/gifs/cart.png',
            ),
          ),
          title: 'Organised Cart',
          body:
              'This app will keep your cart organised.\nJust How you like it.',
        ),
        PageViewModel(
          image: Center(
            child: Image.asset(
              'assets/gifs/coupon.png',
            ),
          ),
          title: 'Daily Discount and Exciting Offers',
          body: 'Exciting offers and discount Coupons exclusively for you!!',
        ),
      ],
      onDone: () {
        _authController.noFirstBoot(false);
        _authController.setupSetupComplete();
      },
      done: Text('Done'),
    );
  }
}
