import 'package:db_vendor/modals/cartmodal.dart';
import 'package:db_vendor/modals/modals.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class CartControllerInterface {
  ///
  ///[Listener] for [Orders] on the server
  ///

  void listenToOrderItem();

  ///
  ///[Update] the [Order] item on the server
  ///

  Future<void> updateOrderItem(CartModal cartModal);

  ///
  ///[Add] the [Order] item on the server
  ///

  Future<void> addOrderItem(CartModal cartModal);

  ///
  ///[Delete] the [Order] item on the server
  ///

  Future<void> deleteOrderItem(CartModal cartModal);

  ///
  ///[Listener] for [Cart] on the server
  ///

  void listenToCartItem();

  ///
  ///[Update] the [Cart] item on the server
  ///

  Future<void> updateCartItem(CartModal cartModal);

  ///
  ///[Add] the [Cart] item on the server
  ///

  Future<void> addCartItem(CartModal cartModal);

  ///
  ///[Delete] the [Cart] item on the server
  ///

  Future<void> deleteCartItem(CartModal cartModal);

  ///
  ///[LISTEN] the [Adress] item on the server
  ///

  Future<void> listenToAddress();

  ///
  ///[Add] the [Address] item on the server
  ///

  Future<void> addAddress(AddressModal addressModal);

  ///
  ///[Update] the [Address] item on the server
  ///

  Future<void> updateAddress(AddressModal addressModal);

  ///
  ///[DELETE] the [Address] item on the server
  ///

  Future<void> deleteAddress(AddressModal addressModal);

  ///
  ///[Change] primry [Address] to the passed one
  ///
  Future<void> updatePrimaryAddress(AddressModal addressModal);

  ///
  ///[Handle] user auth state chnages for something like initialise listeners
  ///

  void handleUserChanges(User user);
}
