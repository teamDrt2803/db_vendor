import 'package:cloud_firestore/cloud_firestore.dart';

import 'modals.dart';

class CartModal {
  final int totalQuantity;
  final Products wooProducts;
  final dynamic time;
  final bool emailSent;
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
    this.emailSent = false,
  });

  factory CartModal.fromFirestore(DocumentSnapshot<Map> snapshot) {
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
      emailSent: map['emailSent'] ?? false,
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
      emailSent: map['emailSent'] ?? false,
    );
  }

  Map<String, dynamic> toMap() => {
        'totalQuantity': totalQuantity,
        'wooProducts': wooProducts.toJson(),
        'time': time,
        'emailSent': false,
      };

  CartModal copyWith({
    int totalQuantity,
    Products wooProducts,
    dynamic time,
    bool emailSent,
  }) {
    return CartModal(
      documentID: documentID,
      reference: reference,
      snapshot: snapshot,
      emailSent: emailSent ?? false,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      wooProducts: wooProducts ?? this.wooProducts,
      time: time ?? this.time,
    );
  }

  @override
  String toString() {
    return '${totalQuantity.toString()}, ${wooProducts.toString()}, ${time.toString()}, ${emailSent.toString()} ';
  }

  @override
  bool operator ==(other) =>
      other is CartModal && documentID == other.documentID;

  @override
  int get hashCode => documentID.hashCode;
}
