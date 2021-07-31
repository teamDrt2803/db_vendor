import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CategoryController extends GetxController {
  Box _preferencesbox;
  final selectedCategory = 0.obs;

  @override
  Future<void> onReady() async {
    _preferencesbox = await Hive.openBox('preferences');
    selectedCategory.value =
        _preferencesbox.get('selectedCategory', defaultValue: 0);
    selectedCategory.bindStream(_preferencesbox
        .watch(key: 'selectedCategory')
        .asBroadcastStream()
        .map((event) => event.value));
    super.onReady();
  }

  Future changeCategory(int value) async =>
      await _preferencesbox.put('selectedCategory', value);
}
