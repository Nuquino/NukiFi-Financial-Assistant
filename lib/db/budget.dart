import 'package:hive/hive.dart';

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

  BudgetCategory({ this.categoryName, this.totalCategoryBudget = 0, this.currentSpent = 0 });
}