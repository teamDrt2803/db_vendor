import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  GetStorage storage = GetStorage();
  final selectedCategory = 0.obs;

  @override
  void onInit() {
    if (storage.hasData('selectedCategory')) {
      storage.listenKey('selectedCategory', (value) {
        selectedCategory.value = value;
      });
    } else {
      storage.write('selectedCategory', 0);
      storage.listenKey('selectedCategory', (value) {
        selectedCategory.value = value;
      });
    }
    super.onInit();
  }
}
