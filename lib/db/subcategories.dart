import 'package:hive/hive.dart';

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
  int attachedCategory;

  BudgetSubcategory({ this.subcategoryName, this.totalSubcategoryBudget = 0, this.currentSubcategorySpent = 0, this.attachedCategory });
}