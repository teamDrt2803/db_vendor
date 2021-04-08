import 'package:db_vendor/main.dart';
import 'package:db_vendor/orders/cartmodal.dart';
import 'package:db_vendor/productsmodal.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  addToCart({WooProducts products, int item}) async {
    await box.add(CartModal(
      wooProducts: products,
      totalQuantity: item ?? 1,
    ));
  }

  incrementCart(int index, CartModal modal) async {
    modal.totalQuantity = modal.totalQuantity + 1;
    await box.putAt(index, modal);
  }

  decrementCart(int index, CartModal modal) async {
    modal.totalQuantity = modal.totalQuantity - 1;
    await box.putAt(index, modal);
  }

  deleteCartItem(int index) async {
    await box.deleteAt(index);
  }
}
