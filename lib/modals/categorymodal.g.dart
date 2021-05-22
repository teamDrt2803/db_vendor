// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorymodal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryModalAdapter extends TypeAdapter<CategoryModal> {
  @override
  final int typeId = 9;

  @override
  CategoryModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryModal(
      images: fields[0] as dynamic,
      name: fields[1] as dynamic,
      description: fields[2] as dynamic,
      id: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryModal obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.images)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatImagesAdapter extends TypeAdapter<CatImages> {
  @override
  final int typeId = 10;

  @override
  CatImages read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatImages(
      number: fields[0] as dynamic,
      src: fields[1] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, CatImages obj) {
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
      other is CatImagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
