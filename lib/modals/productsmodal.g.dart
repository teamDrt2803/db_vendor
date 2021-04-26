// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productsmodal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductsAdapter extends TypeAdapter<Products> {
  @override
  final int typeId = 10;

  @override
  Products read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Products(
      longDescription: fields[0] as String,
      images: (fields[1] as List)?.cast<Images>(),
      quantity: fields[2] as dynamic,
      salesPrice: fields[3] as dynamic,
      regularPrice: fields[4] as dynamic,
      weightG: fields[5] as dynamic,
      stockStatus: fields[6] as String,
      length: fields[7] as String,
      rating: fields[8] as dynamic,
      shortDescription: fields[9] as String,
      subCategory: fields[10] as String,
      subbrand: fields[11] as String,
      name: fields[12] as String,
      width: fields[13] as String,
      onSale: fields[14] as dynamic,
      id: fields[15] as dynamic,
      category: fields[16] as String,
      brand: fields[17] as String,
      setOf: fields[18] as dynamic,
      height: fields[19] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Products obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.longDescription)
      ..writeByte(1)
      ..write(obj.images)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.salesPrice)
      ..writeByte(4)
      ..write(obj.regularPrice)
      ..writeByte(5)
      ..write(obj.weightG)
      ..writeByte(6)
      ..write(obj.stockStatus)
      ..writeByte(7)
      ..write(obj.length)
      ..writeByte(8)
      ..write(obj.rating)
      ..writeByte(9)
      ..write(obj.shortDescription)
      ..writeByte(10)
      ..write(obj.subCategory)
      ..writeByte(11)
      ..write(obj.subbrand)
      ..writeByte(12)
      ..write(obj.name)
      ..writeByte(13)
      ..write(obj.width)
      ..writeByte(14)
      ..write(obj.onSale)
      ..writeByte(15)
      ..write(obj.id)
      ..writeByte(16)
      ..write(obj.category)
      ..writeByte(17)
      ..write(obj.brand)
      ..writeByte(18)
      ..write(obj.setOf)
      ..writeByte(19)
      ..write(obj.height);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImagesAdapter extends TypeAdapter<Images> {
  @override
  final int typeId = 11;

  @override
  Images read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Images(
      number: fields[0] as String,
      src: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Images obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.number)
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
