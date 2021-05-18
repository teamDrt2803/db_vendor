import 'package:cloud_firestore/cloud_firestore.dart';

import 'modals.dart';

class CartModal {
  final int totalQuantity;
  final Products wooProducts;
  final dynamic time;
  final DocumentSnapshot snapshot;
  final DocumentReference reference;
  final String documentID;

  CartModal({
    this.totalQuantity,
    this.wooProducts,
    this.time,
    this.snapshot,
    this.reference,
    this.documentID,
  });

  factory CartModal.fromFirestore(DocumentSnapshot snapshot) {
    if (snapshot == null) return null;
    var map = snapshot.data();
    return CartModal(
      totalQuantity: map['totalQuantity'],
      wooProducts: map['wooProducts'] != null
          ? Products.fromJson(map['wooProducts'])
          : null,
      time: map['time'],
      snapshot: snapshot,
      reference: snapshot.reference,
      documentID: snapshot.id,
    );
  }

  factory CartModal.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CartModal(
      totalQuantity: map['totalQuantity'],
      wooProducts: map['wooProducts'] != null
          ? Products.fromJson(map['wooProducts'])
          : null,
      time: map['time'],
    );
  }

  Map<String, dynamic> toMap() => {
        'totalQuantity': totalQuantity,
        'wooProducts': wooProducts.toJson(),
        'time': time,
      };

  CartModal copyWith({
    int totalQuantity,
    Products wooProducts,
    dynamic time,
  }) {
    return CartModal(
      documentID: documentID,
      reference: reference,
      snapshot: snapshot,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      wooProducts: wooProducts ?? this.wooProducts,
      time: time ?? this.time,
    );
  }

  @override
  String toString() {
    return '${totalQuantity.toString()}, ${wooProducts.toString()}, ${time.toString()}, ';
  }

  @override
  bool operator ==(other) =>
      other is CartModal && documentID == other.documentID;

  @override
  int get hashCode => documentID.hashCode;
}
