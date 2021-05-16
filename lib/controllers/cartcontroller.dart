import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:db_vendor/abstracts/abstractclasses.dart';
import 'package:db_vendor/controllers/auth.dart';

import 'package:db_vendor/modals/modals.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class CartController extends GetxController implements CartControllerInterface {
  ///
  ///Final constant [variables]
  ///
  final _auth = FirebaseAuth.instance;
  final AuthController _authController = Get.find();
  final _processing = false.obs;
  final orders = <CartModal>[].obs;
  final cartItems = <CartModal>[].obs;
  StreamSubscription orderStreamSubscription;
  StreamSubscription cartStreamSubscription;

  ///[Getters]
  FirebaseAuth get auth => _auth;
  AuthController get authController => _authController;
  bool get processing => _processing.value;

  ///
  ///[Overridden] methods
  ///

  @override
  void listenToOrderItem() {
    orderStreamSubscription = _authController.firestore
        .collection('users')
        .doc(_authController.auth.currentUser.uid)
        .collection('orders')
        .snapshots()
        .listen(
      (snapshot) {
        for (var item in snapshot.docChanges) {
          switch (item.type) {
            case DocumentChangeType.added:
              var orders = CartModal.fromFirestore(item.doc);
              this.orders.add(orders);
              break;
            case DocumentChangeType.modified:
              var orders = CartModal.fromFirestore(item.doc);
              var index =
                  this.orders.indexWhere((element) => element == orders);
              if (index != -1) {
                this.orders[index] = orders;
              } else {
                this.orders.add(orders);
              }
              break;
            default:
              var orders = CartModal.fromFirestore(item.doc);
              var index =
                  this.orders.indexWhere((element) => element == orders);
              if (index != -1) {
                this.orders.removeAt(index);
              }
              break;
          }
        }
      },
    );
  }

  @override
  void listenToCartItem() {
    cartStreamSubscription = _authController.firestore
        .collection('users')
        .doc(_authController.auth.currentUser.uid)
        .collection('orders')
        .snapshots()
        .listen(
      (snapshot) {
        for (var item in snapshot.docChanges) {
          switch (item.type) {
            case DocumentChangeType.added:
              var cartItems = CartModal.fromFirestore(item.doc);
              this.cartItems.add(cartItems);
              break;
            case DocumentChangeType.modified:
              var cartItems = CartModal.fromFirestore(item.doc);
              var index =
                  this.cartItems.indexWhere((element) => element == cartItems);
              if (index != -1) {
                this.cartItems[index] = cartItems;
              } else {
                this.cartItems.add(cartItems);
              }
              break;
            default:
              var cartItems = CartModal.fromFirestore(item.doc);
              var index =
                  this.cartItems.indexWhere((element) => element == cartItems);
              if (index != -1) {
                this.cartItems.removeAt(index);
              }
              break;
          }
        }
      },
    );
  }

  @override
  Future<void> updateCartItem(CartModal cartModal) async {
    await _authController.firestore
        .collection('users')
        .doc(_authController.auth.currentUser.uid)
        .collection('cart')
        .doc(cartModal.documentID)
        .update(cartModal.toMap());
  }

  @override
  Future<void> addCartItem(CartModal cartModal) async {
    await _authController.firestore
        .collection('users')
        .doc(_authController.auth.currentUser.uid)
        .collection('cart')
        .add(cartModal.toMap());
  }

  @override
  Future<void> addOrderItem(CartModal cartModal) async {
    await _authController.firestore
        .collection('users')
        .doc(_authController.auth.currentUser.uid)
        .collection('orders')
        .add(cartModal.toMap());
  }

  @override
  Future<void> deleteCartItem(CartModal cartModal) async {
    await _authController.firestore
        .collection('users')
        .doc(_authController.auth.currentUser.uid)
        .collection('cart')
        .doc(cartModal.documentID)
        .delete();
  }

  @override
  Future<void> deleteOrderItem(CartModal cartModal) async {
    await _authController.firestore
        .collection('users')
        .doc(_authController.auth.currentUser.uid)
        .collection('orders')
        .doc(cartModal.documentID)
        .delete();
  }

  @override
  Future<void> updateOrderItem(CartModal cartModal) async {
    await _authController.firestore
        .collection('users')
        .doc(_authController.auth.currentUser.uid)
        .collection('orders')
        .doc(cartModal.documentID)
        .update(cartModal.toMap());
  }

  @override
  void handleUserChanges(User user) {
    if (user?.uid != null) {
      listenToCartItem();
      listenToOrderItem();
    } else {
      if (cartStreamSubscription != null) {
        cartStreamSubscription.cancel();
      }
      if (orderStreamSubscription != null) {
        orderStreamSubscription.cancel();
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    ever(_authController.userStream, handleUserChanges);
    super.onReady();
  }

  @override
  void onClose() {
    orderStreamSubscription.cancel();
    cartStreamSubscription.cancel();
    super.onClose();
  }
}
