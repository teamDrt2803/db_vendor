// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Address.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressModalAdapter extends TypeAdapter<AddressModal> {
  @override
  final int typeId = 6;

  @override
  AddressModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressModal(
      appartmentName: fields[4] as String,
      areaDetails: fields[7] as String,
      city: fields[8] as String,
      contactName: fields[2] as String,
      firstname: fields[0] as String,
      houseNo: fields[3] as String,
      landMark: fields[6] as String,
      lastName: fields[1] as String,
      pincode: fields[9] as String,
      streetName: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddressModal obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.firstname)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.contactName)
      ..writeByte(3)
      ..write(obj.houseNo)
      ..writeByte(4)
      ..write(obj.appartmentName)
      ..writeByte(5)
      ..write(obj.streetName)
      ..writeByte(6)
      ..write(obj.landMark)
      ..writeByte(7)
      ..write(obj.areaDetails)
      ..writeByte(8)
      ..write(obj.city)
      ..writeByte(9)
      ..write(obj.pincode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
