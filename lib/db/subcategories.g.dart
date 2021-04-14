// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategories.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BudgetSubcategoryAdapter extends TypeAdapter<BudgetSubcategory> {
  @override
  final int typeId = 2;

  @override
  BudgetSubcategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BudgetSubcategory(
      subcategoryName: fields[1] as String,
      totalSubcategoryBudget: fields[2] as int,
      currentSubcategorySpent: fields[3] as int,
      attachedCategory: fields[4] as int,
    )..id = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, BudgetSubcategory obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.subcategoryName)
      ..writeByte(2)
      ..write(obj.totalSubcategoryBudget)
      ..writeByte(3)
      ..write(obj.currentSubcategorySpent)
      ..writeByte(4)
      ..write(obj.attachedCategory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetSubcategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
