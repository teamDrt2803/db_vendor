import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModal {
  final String firstname;
  final String lastName;
  final String contactName;
  final String houseNo;
  final String appartmentName;
  final String streetName;
  final String landMark;
  final String areaDetails;
  final String city;
  final String pincode;
  final bool primary;
  final DocumentSnapshot snapshot;
  final DocumentReference reference;
  final String documentID;

  AddressModal({
    this.firstname,
    this.lastName,
    this.contactName,
    this.houseNo,
    this.appartmentName,
    this.streetName,
    this.landMark,
    this.areaDetails,
    this.city,
    this.pincode,
    this.primary,
    this.snapshot,
    this.reference,
    this.documentID,
  });

  factory AddressModal.fromFirestore(DocumentSnapshot snapshot) {
    if (snapshot == null) return null;
    var map = snapshot.data();

    return AddressModal(
      firstname: map['firstname'],
      lastName: map['lastName'],
      contactName: map['contactName'],
      houseNo: map['houseNo'],
      appartmentName: map['appartmentName'],
      streetName: map['streetName'],
      landMark: map['landMark'],
      areaDetails: map['areaDetails'],
      city: map['city'],
      pincode: map['pincode'],
      primary: map['primary'],
      snapshot: snapshot,
      reference: snapshot.reference,
      documentID: snapshot.id,
    );
  }

  factory AddressModal.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AddressModal(
      firstname: map['firstname'],
      lastName: map['lastName'],
      contactName: map['contactName'],
      houseNo: map['houseNo'],
      appartmentName: map['appartmentName'],
      streetName: map['streetName'],
      landMark: map['landMark'],
      areaDetails: map['areaDetails'],
      city: map['city'],
      pincode: map['pincode'],
      primary: map['primary'],
    );
  }

  Map<String, dynamic> toMap() => {
        'firstname': firstname,
        'lastName': lastName,
        'contactName': contactName,
        'houseNo': houseNo,
        'appartmentName': appartmentName,
        'streetName': streetName,
        'landMark': landMark,
        'areaDetails': areaDetails,
        'city': city,
        'pincode': pincode,
        'primary': primary,
      };

  AddressModal copyWith({
    String firstname,
    String lastName,
    String contactName,
    String houseNo,
    String appartmentName,
    String streetName,
    String landMark,
    String areaDetails,
    String city,
    String pincode,
    bool primary,
  }) {
    return AddressModal(
      firstname: firstname ?? this.firstname,
      lastName: lastName ?? this.lastName,
      contactName: contactName ?? this.contactName,
      houseNo: houseNo ?? this.houseNo,
      appartmentName: appartmentName ?? this.appartmentName,
      streetName: streetName ?? this.streetName,
      landMark: landMark ?? this.landMark,
      areaDetails: areaDetails ?? this.areaDetails,
      city: city ?? this.city,
      pincode: pincode ?? this.pincode,
      primary: primary ?? this.primary,
    );
  }

  @override
  String toString() {
    return '${firstname.toString()},\n${contactName.toString()},\n${houseNo.toString()}, ${appartmentName.toString()}, ${streetName.toString()}, ${landMark.toString()}, ${areaDetails.toString()}, ${pincode.isEmpty ? 480001 : pincode.toString()}';
  }

  @override
  bool operator ==(other) =>
      other is AddressModal && documentID == other.documentID;

  @override
  int get hashCode => documentID.hashCode;
}
