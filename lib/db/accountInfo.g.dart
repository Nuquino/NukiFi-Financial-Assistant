// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accountInfo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountInfoAdapter extends TypeAdapter<AccountInfo> {
  @override
  final int typeId = 0;

  @override
  AccountInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountInfo(
      nickname: fields[1] as String,
      budgetTimeFrame: fields[2] as int,
    )..id = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, AccountInfo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nickname)
      ..writeByte(2)
      ..write(obj.budgetTimeFrame);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
