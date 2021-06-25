import 'package:cloud_firestore/cloud_firestore.dart';

class Coupons {
  final String title;
  final String description;
  final String imageURL;
  final int discount;
  final String type;
  final String code;
  final int maxDiscount;
  final bool productSpecific;
  final List<String> productIds;
  final int minCartValue;
  final bool newCustomersOnly;
  final DocumentSnapshot snapshot;
  final DocumentReference reference;
  final String documentID;

  Coupons({
    this.title,
    this.description,
    this.imageURL,
    this.discount,
    this.type,
    this.code,
    this.maxDiscount,
    this.productSpecific,
    this.productIds,
    this.minCartValue,
    this.newCustomersOnly,
    this.snapshot,
    this.reference,
    this.documentID,
  });

  factory Coupons.fromFirestore(DocumentSnapshot snapshot) {
    if (snapshot == null) return null;
    var map = snapshot.data();

    return Coupons(
      title: map['title'],
      description: map['description'],
      imageURL: map['imageURL'],
      discount: map['discount'],
      type: map['type'],
      code: map['code'],
      maxDiscount: map['maxDiscount'],
      productSpecific: map['productSpecific'],
      productIds: map['productIds'] != null
          ? List<String>.from(map['productIds'])
          : null,
      minCartValue: map['minCartValue'],
      newCustomersOnly: map['newCustomersOnly'],
      snapshot: snapshot,
      reference: snapshot.reference,
      documentID: snapshot.id,
    );
  }

  factory Coupons.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Coupons(
      title: map['title'],
      description: map['description'],
      imageURL: map['imageURL'],
      discount: map['discount'],
      type: map['type'],
      code: map['code'],
      maxDiscount: map['maxDiscount'],
      productSpecific: map['productSpecific'],
      productIds: map['productIds'] != null
          ? List<String>.from(map['productIds'])
          : null,
      minCartValue: map['minCartValue'],
      newCustomersOnly: map['newCustomersOnly'],
    );
  }

  Map<String, dynamic> toMap() => {
        'title': title,
        'description': description,
        'imageURL': imageURL,
        'discount': discount,
        'type': type,
        'code': code,
        'maxDiscount': maxDiscount,
        'productSpecific': productSpecific,
        'productIds': productIds,
        'minCartValue': minCartValue,
        'newCustomersOnly': newCustomersOnly,
      };

  Coupons copyWith({
    String title,
    String description,
    String imageURL,
    int discount,
    String type,
    String code,
    int maxDiscount,
    bool productSpecific,
    List<String> productIds,
    int minCartValue,
    bool newCustomersOnly,
  }) {
    return Coupons(
      title: title ?? this.title,
      description: description ?? this.description,
      imageURL: imageURL ?? this.imageURL,
      discount: discount ?? this.discount,
      type: type ?? this.type,
      code: code ?? this.code,
      maxDiscount: maxDiscount ?? this.maxDiscount,
      productSpecific: productSpecific ?? this.productSpecific,
      productIds: productIds ?? this.productIds,
      minCartValue: minCartValue ?? this.minCartValue,
      newCustomersOnly: newCustomersOnly ?? this.newCustomersOnly,
    );
  }

  @override
  String toString() {
    return '${title.toString()}, ${description.toString()}, ${imageURL.toString()}, ${discount.toString()}, ${type.toString()}, ${code.toString()}, ${maxDiscount.toString()}, ${productSpecific.toString()}, ${productIds.toString()}, ${minCartValue.toString()}, ${newCustomersOnly.toString()}, ';
  }

  @override
  bool operator ==(other) => other is Coupons && documentID == other.documentID;

  int get hashCode => documentID.hashCode;
}
