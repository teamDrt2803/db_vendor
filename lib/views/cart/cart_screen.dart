import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';
import 'package:db_vendor/main.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      // bottomNavigationBar: ValueListenableBuilder(
      //     valueListenable: box.listenable(),
      //     builder: (context, box, _) {
      //       return box.length > 0 ? CheckoutCard() : SizedBox.shrink();
      //     }),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          // ValueListenableBuilder(
          //   valueListenable: box.listenable(),
          //   builder: (context, box, _) {
          //     return Text(
          //       "${box.length} items",
          //       style: Theme.of(context).textTheme.caption,
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
