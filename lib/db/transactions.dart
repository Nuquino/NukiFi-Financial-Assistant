import 'package:hive/hive.dart';

part 'transactions.g.dart';

@HiveType(typeId: 3)
// ignore: camel_case_types
class transaction extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String merchantName;
  @HiveField(2)
  int transactionAmount;
  @HiveField(3)
  DateTime transactionTime;
  @HiveField(4)
  int category;
  @HiveField(5)
  int subcategory;

  transaction({ this.merchantName = '', this.transactionAmount, this.transactionTime, this.category, this.subcategory });
}