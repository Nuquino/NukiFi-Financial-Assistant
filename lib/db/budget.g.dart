// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BudgetCategoryAdapter extends TypeAdapter<BudgetCategory> {
  @override
  final int typeId = 1;

  @override
  BudgetCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BudgetCategory(
      categoryName: fields[1] as String,
      totalCategoryBudget: fields[2] as int,
      currentSpent: fields[3] as int,
    )
      ..id = fields[0] as String
      ..subcategories = (fields[4] as List)?.cast<BudgetCategory>()
      ..categoryTransactions = (fields[5] as List)?.cast<transaction>();
  }

  @override
  void write(BinaryWriter writer, BudgetCategory obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.categoryName)
      ..writeByte(2)
      ..write(obj.totalCategoryBudget)
      ..writeByte(3)
      ..write(obj.currentSpent)
      ..writeByte(4)
      ..write(obj.subcategories)
      ..writeByte(5)
      ..write(obj.categoryTransactions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
