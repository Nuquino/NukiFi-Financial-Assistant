import 'package:hive/hive.dart';
import 'package:nukifi_financial_assistant/db/transactions.dart';

part 'budget.g.dart';

@HiveType(typeId: 1)
class BudgetCategory extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String categoryName;
  @HiveField(2)
  int totalCategoryBudget;
  @HiveField(3)
  int currentSpent;
  @HiveField(4)
  List<BudgetCategory> subcategories;
  @HiveField(5)
  List<transaction> categoryTransactions;

  BudgetCategory({ this.categoryName = '', this.totalCategoryBudget = 0, this.currentSpent = 0 });
}