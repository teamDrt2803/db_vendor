import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:db_vendor/modals/modals.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductController extends GetxController {
  RxList<Products> products = <Products>[].obs;
  @override
  void onInit() {
    var firestore = FirebaseFirestore.instance;
    firestore.collection('products').snapshots().listen((event) {
      for (DocumentSnapshot product in event.docs) {
        products.add(new Products.fromJson(product.data()));
      }
    });
    super.onInit();
  }
}
