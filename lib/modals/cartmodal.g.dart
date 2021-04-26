// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartmodal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartModalAdapter extends TypeAdapter<CartModal> {
  @override
  final int typeId = 4;

  @override
  CartModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartModal(
      totalQuantity: fields[0] as int,
      wooProducts: fields[1] as Products,
    );
  }

  @override
  void write(BinaryWriter writer, CartModal obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.totalQuantity)
      ..writeByte(1)
      ..write(obj.wooProducts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
