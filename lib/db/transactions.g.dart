// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class transactionAdapter extends TypeAdapter<transaction> {
  @override
  final int typeId = 3;

  @override
  transaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return transaction(
      merchantName: fields[1] as String,
      transactionAmount: fields[2] as int,
      transactionTime: fields[3] as DateTime,
      category: fields[4] as int,
      subcategory: fields[5] as int,
    )..id = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, transaction obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.merchantName)
      ..writeByte(2)
      ..write(obj.transactionAmount)
      ..writeByte(3)
      ..write(obj.transactionTime)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.subcategory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is transactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
