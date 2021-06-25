import 'package:another_flushbar/flushbar_helper.dart';
import 'package:db_vendor/controllers/auth.dart';
import 'package:db_vendor/controllers/categorycontroller.dart';
import 'package:db_vendor/helpers/custappbar.dart';
import 'package:db_vendor/helpers/default_button.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:db_vendor/views/home/components/special_offers.dart';
import 'package:db_vendor/views/mainscreen/mainscreen.dart';
import 'package:db_vendor/views/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  final CategoryController _categorySelector = Get.find();
  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        child: DefaultButton(
          text: 'Save',
          press: () async {
            await _categorySelector.storage.write(
              'selectedCategory',
              _categorySelector.selectedCategory.value,
            );
            debugPrint(Get.previousRoute);

            if (Get.previousRoute == SplashScreen.routeName) {
              await _authController.preferenceBox.put('firstBoot', false);
            } else if (Get.previousRoute == MainScreen.routeName) {
              Get.back();
            }
            await FlushbarHelper.createInformation(message: 'Saved Category')
                .show(context);
          },
        ),
      ),
      appBar: CustAppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Select a category',
        ),
      ),
      body: Container(
        clipBehavior: Clip.none,
        child: Obx(
          () => ListView(clipBehavior: Clip.none, children: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0, top: 16.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SpecialOfferCard(
                    width: double.infinity,
                    image: 'assets/images/Image Banner 3.png',
                    category: 'Fashion',
                    numOfBrands: 50,
                    press: () {
                      _categorySelector.selectedCategory.value = 0;
                    },
                  ),
                  Visibility(
                    visible: _categorySelector.selectedCategory.value == 0,
                    child: IgnorePointer(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: getProportionateScreenWidth(20)),
                        //color: Colors.white,
                        width: double.infinity,
                        height: getProportionateScreenWidth(100),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _categorySelector.selectedCategory.value == 0,
                    child: Positioned(
                      right: -5,
                      top: -5,
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.done,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0, top: 16.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SpecialOfferCard(
                    width: double.infinity,
                    image: 'assets/images/Image Banner 2.png',
                    category: 'Electronics',
                    numOfBrands: 20,
                    press: () async {
                      _categorySelector.selectedCategory.value = 1;
                    },
                  ),
                  Visibility(
                    visible: _categorySelector.selectedCategory.value == 1,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: getProportionateScreenWidth(20)),
                      //color: Colors.white,
                      width: double.infinity,
                      height: getProportionateScreenWidth(100),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _categorySelector.selectedCategory.value == 1,
                    child: Positioned(
                      right: -5,
                      top: -5,
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.done,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0, top: 16.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SpecialOfferCard(
                    width: double.infinity,
                    image: 'assets/images/grocery.png',
                    category: 'Grocery',
                    numOfBrands: 50,
                    press: () {
                      _categorySelector.selectedCategory.value = 2;
                    },
                  ),
                  Visibility(
                    visible: _categorySelector.selectedCategory.value == 2,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: getProportionateScreenWidth(20)),
                      //color: Colors.white,
                      width: double.infinity,
                      height: getProportionateScreenWidth(100),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _categorySelector.selectedCategory.value == 2,
                    child: Positioned(
                      right: -5,
                      top: -5,
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.done,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0, top: 16.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SpecialOfferCard(
                    width: double.infinity,
                    image: 'assets/images/fmcg.png',
                    category: 'FMCG',
                    numOfBrands: 18,
                    press: () {
                      _categorySelector.selectedCategory.value = 3;
                    },
                  ),
                  Visibility(
                    visible: _categorySelector.selectedCategory.value == 3,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: getProportionateScreenWidth(20)),
                      //color: Colors.white,
                      width: double.infinity,
                      height: getProportionateScreenWidth(100),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _categorySelector.selectedCategory.value == 3,
                    child: Positioned(
                      right: -5,
                      top: -5,
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.done,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
