import 'package:hive/hive.dart';
import 'package:nukifi_financial_assistant/db/transactions.dart';

part 'subcategories.g.dart';

@HiveType(typeId: 2)
class BudgetSubcategory extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String subcategoryName;
  @HiveField(2)
  int totalSubcategoryBudget;
  @HiveField(3)
  int currentSubcategorySpent;
  @HiveField(4)
  List<transaction> subcategoryTransactions;

  BudgetSubcategory({ this.subcategoryName = '', this.totalSubcategoryBudget = 0, this.currentSubcategorySpent = 0 });
}