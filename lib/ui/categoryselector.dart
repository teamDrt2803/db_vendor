import 'package:db_vendor/ui/screens/home/components/special_offers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select a Category',
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0, top: 16.0),
              child: SpecialOfferCard(
                width: double.infinity,
                image: "assets/images/Image Banner 3.png",
                category: "Fashion",
                numOfBrands: 50,
                press: () {
                  Navigator.popUntil(context, ModalRoute.withName('/wrapper'));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0, top: 16.0),
              child: SpecialOfferCard(
                width: double.infinity,
                image: "assets/images/Image Banner 2.png",
                category: "Electronics",
                numOfBrands: 20,
                press: () {
                  Navigator.popUntil(context, ModalRoute.withName('/wrapper'));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0, top: 16.0),
              child: SpecialOfferCard(
                width: double.infinity,
                image: "assets/images/grocery.png",
                category: "Grocery",
                numOfBrands: 50,
                press: () {
                  Navigator.popUntil(context, ModalRoute.withName('/wrapper'));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0, top: 16.0),
              child: SpecialOfferCard(
                width: double.infinity,
                image: "assets/images/fmcg.png",
                category: "FMCG",
                numOfBrands: 18,
                press: () {
                  Navigator.popUntil(context, ModalRoute.withName('/wrapper'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
