import 'dart:async';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:db_vendor/abstracts/abstractclasses.dart';
import 'package:db_vendor/controllers/auth.dart';

import 'package:db_vendor/modals/modals.dart';
import 'package:db_vendor/views/sign_in/sign_in_screen.dart';

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
  final addressItems = <AddressModal>[].obs;
  StreamSubscription orderStreamSubscription;
  StreamSubscription cartStreamSubscription;
  StreamSubscription addressStreamSubscription;

  ///[Getters]
  FirebaseAuth get auth => _auth;
  AuthController get authController => _authController;
  bool get processing => _processing.value;
  set processing(bool value) => _processing.value = value;

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
              var index =
                  this.orders.indexWhere((element) => element == orders);
              if (index != -1) {
                this.orders[index] = orders;
              } else {
                this.orders.add(orders);
              }
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
        .collection('cart')
        .snapshots()
        .listen(
      (snapshot) {
        for (var item in snapshot.docChanges) {
          switch (item.type) {
            case DocumentChangeType.added:
              var cartItems = CartModal.fromFirestore(item.doc);
              var index =
                  this.cartItems.indexWhere((element) => element == cartItems);
              if (index != -1) {
                this.cartItems[index] = cartItems;
              } else {
                this.cartItems.add(cartItems);
              }
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
    print(cartModal.documentID);
    await _authController.firestore
        .collection('users')
        .doc(_authController.auth.currentUser.uid)
        .collection('cart')
        .doc(cartModal.documentID)
        .update(cartModal.toMap());
  }

  @override
  Future<void> addCartItem(CartModal cartModal) async {
    if (_authController.auth.currentUser != null) {
      var index = cartItems.indexWhere(
          (element) => element.wooProducts.id == cartModal.wooProducts.id);
      if (index != -1) {
        await updateCartItem(cartItems[index].copyWith(
            totalQuantity:
                cartItems[index].totalQuantity + cartModal.totalQuantity));
        return;
      }
      await _authController.firestore
          .collection('users')
          .doc(_authController.auth.currentUser.uid)
          .collection('cart')
          .add(cartModal.toMap());
    } else {
      // ignore: unawaited_futures
      FlushbarHelper.createInformation(
          message: 'Please Login to use Cart functionality');
      // ignore: unawaited_futures
      Get.to(() => SignInScreen());
    }
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

  Future<void> emptyCart() async {
    var list = await _authController.firestore
        .collection('users')
        .doc(_authController.auth.currentUser.uid)
        .collection('cart')
        .get();
    for (var item in list.docs) {
      await _authController.firestore
          .collection('users')
          .doc(_authController.auth.currentUser.uid)
          .collection('cart')
          .doc(item.id)
          .delete();
    }
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
      print('*****');
      print(user.uid);
      print('*****');
      listenToCartItem();
      listenToOrderItem();
      listenToAddress();
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
    addressStreamSubscription.cancel();
    super.onClose();
  }

  @override
  Future<void> listenToAddress() async {
    orderStreamSubscription = _authController.firestore
        .collection('users')
        .doc(_authController.auth.currentUser.uid)
        .collection('address')
        .snapshots()
        .listen(
      (snapshot) {
        for (var item in snapshot.docChanges) {
          switch (item.type) {
            case DocumentChangeType.added:
              var addressItems = AddressModal.fromFirestore(item.doc);
              var index = this
                  .addressItems
                  .indexWhere((element) => element == addressItems);
              if (index != -1) {
                this.addressItems[index] = addressItems;
              } else {
                this.addressItems.add(addressItems);
              }
              break;
            case DocumentChangeType.modified:
              var addressItems = AddressModal.fromFirestore(item.doc);
              var index = this
                  .addressItems
                  .indexWhere((element) => element == addressItems);
              if (index != -1) {
                this.addressItems[index] = addressItems;
              } else {
                this.addressItems.add(addressItems);
              }
              break;
            default:
              var addressItems = AddressModal.fromFirestore(item.doc);
              var index = this
                  .addressItems
                  .indexWhere((element) => element == addressItems);
              if (index != -1) {
                this.addressItems.removeAt(index);
              }
              break;
          }
        }
      },
    );
  }

  @override
  Future<void> updateAddress(AddressModal addressModal) async {
    await _authController.firestore
        .collection('users')
        .doc(_authController.auth.currentUser.uid)
        .collection('address')
        .doc(addressModal.documentID)
        .update(addressModal.toMap());
  }

  @override
  Future<void> addAddress(AddressModal addressModal) async {
    await _authController.firestore
        .collection('users')
        .doc(_authController.auth.currentUser.uid)
        .collection('address')
        .add(addressModal.toMap());
  }

  @override
  Future<void> deleteAddress(AddressModal addressModal) async {
    await _authController.firestore
        .collection('users')
        .doc(_authController.auth.currentUser.uid)
        .collection('address')
        .doc(addressModal.documentID)
        .delete();
  }

  @override
  Future<void> updatePrimaryAddress(AddressModal addressModal) async {}
}
