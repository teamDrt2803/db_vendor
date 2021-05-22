// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationDataAdapter extends TypeAdapter<NotificationData> {
  @override
  final int typeId = 20;

  @override
  NotificationData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationData(
      total: fields[0] as String,
      route: fields[1] as String,
      orderId: fields[2] as String,
      imageUrl: fields[3] as String,
      purchase_date: fields[4] as String,
      body: fields[5] as String,
      type: fields[6] as String,
      title: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationData obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.total)
      ..writeByte(1)
      ..write(obj.route)
      ..writeByte(2)
      ..write(obj.orderId)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.purchase_date)
      ..writeByte(5)
      ..write(obj.body)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
