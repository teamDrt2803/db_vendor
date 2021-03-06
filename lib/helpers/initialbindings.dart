import 'package:db_vendor/controllers/categorycontroller.dart';
import 'package:db_vendor/controllers/controllers.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(WooController(), permanent: true);
    Get.put(CartController(), permanent: true);
    Get.put(ProductController(), permanent: true);
    Get.put(FavouritesController(), permanent: true);
    Get.put(CategoryController(), permanent: true);
  }
}
