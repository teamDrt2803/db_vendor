import 'package:db_vendor/helpers/constants.dart';

import 'package:db_vendor/helpers/wrapper.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static String routeName = '/splashscreen';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  Animation opacity;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);
    opacity = Tween(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigationPage() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => Wrapper()));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                      opacity: opacity.value,
                      child: Image.asset(
                        'assets/logo.png',
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 0.5,
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Opacity(
                  opacity: opacity.value,
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(text: 'Powered by '),
                          TextSpan(
                              text: 'teamDrt',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor))
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
