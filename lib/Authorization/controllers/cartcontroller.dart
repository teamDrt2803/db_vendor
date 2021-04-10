import 'package:db_vendor/main.dart';
import 'package:db_vendor/orders/cartmodal.dart';
import 'package:db_vendor/productsmodal.dart';
import 'package:db_vendor/ui/models/Address.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CartController extends GetxController {
  FirebaseDatabase _firebaseDatabase = FirebaseDatabase();
  DatabaseReference databaseReference;
  FirebaseAuth _auth = FirebaseAuth.instance;
  User _user;
  @override
  Future<void> onInit() async {
    _user = _auth.currentUser;
    databaseReference = _firebaseDatabase.reference();

    super.onInit();
  }

  Future<bool> addToAddress({AddressModal addressModal}) async {
    _auth.currentUser;
    return addressBox.add(addressModal).then((value) async {
      return await databaseReference
          .child(
            _auth.currentUser.uid,
          )
          .child(
            'address',
          )
          .set(
            addressModal.toJson(),
          )
          .then((value) => true);
    });
  }

  addToCart({WooProducts products, int item}) async {
    if (box.length > 0) {
      dynamic exist = box.values.toList().firstWhere(
          (element) => element.wooProducts.id == products.id, orElse: () {
        return null;
      });
      if (exist == null) {
        await box.add(CartModal(
          wooProducts: products,
          totalQuantity: item ?? 1,
        ));
      } else {
        incrementCart(
          box.values.toList().indexWhere(
              (element) => element.wooProducts.id == exist.wooProducts.id),
          CartModal(
            wooProducts: products,
            totalQuantity: exist.totalQuantity,
          ),
        );
      }
      //box.putAt(, )
    } else {
      await box.add(CartModal(
        wooProducts: products,
        totalQuantity: item ?? 1,
      ));
    }
    Get.snackbar('Product Added to Cart',
        'Your Product ${products.name} has been addd to cart');
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
