import 'dart:ui';

import 'package:db_vendor/ui/components/coustom_bottom_nav_bar.dart';
import 'package:db_vendor/ui/constants.dart';
import 'package:db_vendor/ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../enums.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        bottomNavigationBar:
            CustomBottomNavBar(selectedMenu: MenuState.favourite),
        appBar: AppBar(
          title: Text('My Orders'),
        ),
        body: Stack(
          children: [
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
                  itemCount: 20,
                  itemBuilder: (ctxt, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        height: getProportionateScreenHeight(200),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        // padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Today, 7:30 PM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kPrimaryColor),
                                    ),
                                    Text(
                                      "₹20",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kSecondaryColor),
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
                                  color: kPrimaryColor.withOpacity(0.7),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.verified_rounded,
                                          color: kPrimaryColor,
                                        ),
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(10),
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
                                        primary: kPrimaryLightColor,
                                        minimumSize: Size(20, 30),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "Re-order",
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
