import 'package:db_vendor/Global/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: primary, statusBarBrightness: Brightness.dark),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: primary,
            actions: <Widget>[
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Card(
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: secondary,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Text(
                      "My Orders",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Card(
                        child: IconButton(
                          icon: Icon(
                            Icons.home_outlined,
                            color: secondary,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      child: Text("12"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
