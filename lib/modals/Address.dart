import 'package:hive/hive.dart';
part 'Address.g.dart';

@HiveType(typeId: 6)
class AddressModal {
  @HiveField(0)
  String firstname;
  @HiveField(1)
  String lastName;
  @HiveField(2)
  String contactName;
  @HiveField(3)
  String houseNo;
  @HiveField(4)
  String appartmentName;
  @HiveField(5)
  String streetName;
  @HiveField(6)
  String landMark;
  @HiveField(7)
  String areaDetails;
  @HiveField(8)
  String city;
  @HiveField(9)
  String pincode;
  AddressModal({
    this.appartmentName,
    this.areaDetails,
    this.city,
    this.contactName,
    this.firstname,
    this.houseNo,
    this.landMark,
    this.lastName,
    this.pincode,
    this.streetName,
  });

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['firstname'] = firstname;
    data['lastName'] = lastName;
    data['contactName'] = contactName;
    data['houseNo'] = houseNo;
    data['appartmentName'] = appartmentName;
    data['streetName'] = streetName;
    data['landMark'] = landMark;
    data['areaDetails'] = areaDetails;
    data['city'] = city;
    data['pincode'] = pincode;
    return data;
  }

  // AddressModal.fromJson() {}
}
