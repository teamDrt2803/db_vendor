import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/main.dart';

import 'package:db_vendor/modals/modals.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  FirebaseDatabase _firebaseDatabase = FirebaseDatabase();
  DatabaseReference databaseReference;
  FirebaseAuth _auth = FirebaseAuth.instance;
  GetStorage storage = GetStorage();
  final uploading = false.obs;
  var firestore = FirebaseFirestore.instance;
  RxList<CartModal> cartList = <CartModal>[].obs;
  @override
  Future<void> onInit() async {
    databaseReference = _firebaseDatabase.reference();
    fetchOrders();
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

  Future<void> confirmOrder() async {
    uploading.value = true;
    DateTime time = DateTime.now();
    var firstproduct = box.values.toList().first;
    var cartlist = box.values.toList().map((e) {
      e.time = time.millisecondsSinceEpoch;
      return e.toJson();
    }).toList();
    for (var item in cartlist) {
      await firestore.collection(_auth.currentUser.uid + "_orders").add(item);
    }

    var response = await http.get(
      Uri.parse(
        'https://api.discount-bazaar.com/orders/placed?email=${storage.read(Consts.email)}&name=${storage.read(Consts.userName)}&order_id=${time.millisecondsSinceEpoch.toString()}&product=${firstproduct.wooProducts.name}',
      ),
    );
    debugPrint(response.statusCode.toString());
    await box.deleteAll(box.keys);
    fetchOrders();
    uploading.value = false;
  }

  fetchOrders() async {
    var orders = await firestore
        .collection(_auth.currentUser.uid + "_orders")
        .orderBy('ts')
        .get();
    cartList.clear();
    for (var item in orders.docs) {
      cartList.add(new CartModal.fromJson(item.data()));
    }
  }

  addToCart({Products products, int item}) async {
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
