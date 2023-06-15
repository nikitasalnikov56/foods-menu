// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BasketListAdapter extends TypeAdapter<BasketList> {
  @override
  final int typeId = 0;

  @override
  BasketList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BasketList(
      name: fields[0] as String?,
      imgUrl: fields[1] as String?,
      price: fields[2] as int?,
      weight: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, BasketList obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.imgUrl)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasketListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
