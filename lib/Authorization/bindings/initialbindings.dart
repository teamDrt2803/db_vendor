import 'package:db_vendor/Authorization/controllers/authcontroller.dart';
import 'package:db_vendor/Authorization/controllers/woocontroller.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(WooController(), permanent: true);
  }
}
