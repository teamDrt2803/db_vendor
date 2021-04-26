// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouriteProductAdapter extends TypeAdapter<FavouriteProduct> {
  @override
  final int typeId = 8;

  @override
  FavouriteProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouriteProduct(
      id: fields[0] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteProduct obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
