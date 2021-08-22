import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CategoryController extends GetxController {
  final selectedCategory = 0.obs;
  Box box;
  @override
  Future<void> onReady() async {
    box = await Hive.openBox('name');
    selectedCategory.value = box.get('selectedCategory');
    selectedCategory.bindStream(box
        .watch(key: 'selectedCategory')
        .asBroadcastStream()
        .map((event) => event.value));
    super.onReady();
  }

  void updateCategory(int value) => box.put('selectedCategory', value);
}
