// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productsmodal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WooProductsAdapter extends TypeAdapter<WooProducts> {
  @override
  final int typeId = 1;

  @override
  WooProducts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WooProducts(
      id: fields[0] as int,
      name: fields[1] as String,
      featured: fields[2] as bool,
      description: fields[3] as String,
      shortDescription: fields[4] as String,
      sku: fields[5] as String,
      price: fields[6] as String,
      regularPrice: fields[7] as String,
      salePrice: fields[8] as String,
      onSale: fields[9] as bool,
      stockQuantity: fields[10] as int,
      weight: fields[11] as String,
      dimensions: fields[12] as Dimensions,
      averageRating: fields[13] as String,
      ratingCount: fields[14] as int,
      parentId: fields[15] as int,
      images: (fields[16] as List)?.cast<Images>(),
    );
  }

  @override
  void write(BinaryWriter writer, WooProducts obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.featured)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.shortDescription)
      ..writeByte(5)
      ..write(obj.sku)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.regularPrice)
      ..writeByte(8)
      ..write(obj.salePrice)
      ..writeByte(9)
      ..write(obj.onSale)
      ..writeByte(10)
      ..write(obj.stockQuantity)
      ..writeByte(11)
      ..write(obj.weight)
      ..writeByte(12)
      ..write(obj.dimensions)
      ..writeByte(13)
      ..write(obj.averageRating)
      ..writeByte(14)
      ..write(obj.ratingCount)
      ..writeByte(15)
      ..write(obj.parentId)
      ..writeByte(16)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WooProductsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DimensionsAdapter extends TypeAdapter<Dimensions> {
  @override
  final int typeId = 2;

  @override
  Dimensions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Dimensions(
      length: fields[0] as String,
      width: fields[1] as String,
      height: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Dimensions obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.length)
      ..writeByte(1)
      ..write(obj.width)
      ..writeByte(2)
      ..write(obj.height);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DimensionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImagesAdapter extends TypeAdapter<Images> {
  @override
  final int typeId = 3;

  @override
  Images read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Images(
      id: fields[0] as int,
      src: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Images obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.src);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
