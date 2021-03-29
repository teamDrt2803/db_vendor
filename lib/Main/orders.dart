import 'dart:ui';

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
          body: Stack(children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              color: primary,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 45,
                          width: 45,
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
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
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
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  padding: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  height: MediaQuery.of(context).size.height * 0.88,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (ctxt, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Today, 7:30 PM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: primary),
                                    ),
                                    Text(
                                      "₹20",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: secondary),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Items",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 1,
                                  itemBuilder: (ctxt, index) {
                                    return Container(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                child: Image.network(
                                                    "https://www.pngfind.com/pngs/m/672-6725952_amul-masti-spiced-amul-butter-milk-hd-png.png"),
                                              ),
                                              Text(
                                                "Amul Masti Buttermilk x 2",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                "₹20",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                Divider(
                                  thickness: 1,
                                  color: primary.withOpacity(0.7),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.verified_rounded,
                                          color: primary,
                                        ),
                                        Text(
                                          "Delivered",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.blueAccent,
                                            minimumSize: Size(20, 30)),
                                        onPressed: () {},
                                        child: Text("Re-order"))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      })),
            ),
          ]),
        ));
  }
}
