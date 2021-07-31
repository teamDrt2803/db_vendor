import 'package:db_vendor/controllers/app_controller.dart';
import 'package:db_vendor/controllers/auth.dart';
import 'package:db_vendor/controllers/categorycontroller.dart';
import 'package:db_vendor/widgets/category_selector_card.dart';
import 'package:db_vendor/widgets/parent_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategorySelector extends StatelessWidget {
  CategorySelector({Key key}) : super(key: key);
  final CategoryController _categoryController = Get.find();
  final AppController _appController = Get.find();
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ParentWidget.button(
      padding: EdgeInsets.symmetric(horizontal: 16),
      title: 'Complete',
      onPressed: () {
        HapticFeedback.lightImpact();
        _authController.preferenceBox.put('firstBoot', false);
      },
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Text(
              'What Category would you like?',
              style: Get.textTheme.headline5.copyWith(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.bold,
                letterSpacing: 0.7,
              ),
            ),
            SizedBox(height: 50),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 1.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                ...List.generate(
                  _appController.categoryList.length,
                  (index) => Obx(
                    () => GestureDetector(
                      onTap: () => _categoryController.changeCategory(index),
                      child: CategorySelectorCard(
                        map: _appController.categoryList[index],
                        selected:
                            _categoryController.selectedCategory.value == index,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
