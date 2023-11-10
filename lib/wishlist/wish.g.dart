// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class wishlistAdapter extends TypeAdapter<wishlist> {
  @override
  final int typeId = 5;

  @override
  wishlist read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return wishlist(
      name: fields[0] as String,
      image: fields[2] as String?,
      price: fields[1] as String,
      cate: fields[4] as String?,
      disc: fields[5] as String?,
      id: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, wishlist obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.cate)
      ..writeByte(5)
      ..write(obj.disc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is wishlistAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
