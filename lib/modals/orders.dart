import 'package:cloud_firestore/cloud_firestore.dart';

import 'cartmodal.dart';
import 'coupons.dart';

class OrdersItem {
  final double originalPrice;
  final double discountedPrice;
  final double disocunt;
  final Coupons appliedCoupon;
  final List<CartModal> cartItems;
  final int timeStamp;
  final DocumentSnapshot snapshot;
  final DocumentReference reference;
  final String documentID;

  OrdersItem({
    this.originalPrice,
    this.discountedPrice,
    this.disocunt,
    this.appliedCoupon,
    this.cartItems,
    this.timeStamp,
    this.snapshot,
    this.reference,
    this.documentID,
  });

  factory OrdersItem.fromFirestore(DocumentSnapshot snapshot) {
    if (snapshot == null) return null;
    var map = snapshot.data() as Map;
    return OrdersItem(
      originalPrice: map['originalPrice'],
      discountedPrice: map['discountedPrice'],
      disocunt: map['disocunt'],
      appliedCoupon: map['appliedCoupon'] != null
          ? Coupons.fromMap(map['appliedCoupon'])
          : null,
      cartItems: map['cartItems'] != null
          ? map['cartItems']
              .map<CartModal>((e) => CartModal.fromMap(e))
              .toList()
          : null,
      timeStamp: map['timeStamp'],
      snapshot: snapshot,
      reference: snapshot.reference,
      documentID: snapshot.id,
    );
  }

  factory OrdersItem.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return OrdersItem(
      originalPrice: map['originalPrice'],
      discountedPrice: map['discountedPrice'],
      disocunt: map['disocunt'],
      appliedCoupon: map['appliedCoupon'] != null
          ? Coupons.fromMap(map['appliedCoupon'])
          : null,
      cartItems: map['cartItems'] != null
          ? List<CartModal>.from(map['cartItems'])
          : null,
      timeStamp: map['timeStamp'],
    );
  }

  Map<String, dynamic> toMap() => {
        'originalPrice': originalPrice,
        'discountedPrice': discountedPrice,
        'disocunt': disocunt,
        'appliedCoupon': appliedCoupon.toMap(),
        'cartItems': cartItems.map((e) => e.toMap()).toList(),
        'timeStamp': timeStamp,
      };

  OrdersItem copyWith({
    double originalPrice,
    double discountedPrice,
    double disocunt,
    Coupons appliedCoupon,
    List<CartModal> cartItems,
    int timeStamp,
  }) {
    return OrdersItem(
      originalPrice: originalPrice ?? this.originalPrice,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      disocunt: disocunt ?? this.disocunt,
      appliedCoupon: appliedCoupon ?? this.appliedCoupon,
      cartItems: cartItems ?? this.cartItems,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }

  @override
  String toString() {
    return '${originalPrice.toString()}, ${discountedPrice.toString()}, ${disocunt.toString()}, ${appliedCoupon.toString()}, ${cartItems.toString()}, ${timeStamp.toString()}, ';
  }

  @override
  bool operator ==(other) =>
      other is OrdersItem && documentID == other.documentID;

  @override
  int get hashCode => documentID.hashCode;
}
