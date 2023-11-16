// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_cart.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderhistoryModelAdapter extends TypeAdapter<OrderhistoryModel> {
  @override
  final int typeId = 6;

  @override
  OrderhistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderhistoryModel(
      address: fields[6] as String?,
      city: fields[7] as String?,
      number: fields[9] as String?,
      pincode: fields[8] as String?,
      usrname: fields[10] as String?,
      image: fields[1] as String,
      title: fields[2] as String,
      price: fields[3] as num,
      id: fields[0] as int?,
      qnty: fields[5] as double?,
      cate: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OrderhistoryModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.cate)
      ..writeByte(5)
      ..write(obj.qnty)
      ..writeByte(6)
      ..write(obj.address)
      ..writeByte(7)
      ..write(obj.city)
      ..writeByte(8)
      ..write(obj.pincode)
      ..writeByte(9)
      ..write(obj.number)
      ..writeByte(10)
      ..write(obj.usrname);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderhistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
