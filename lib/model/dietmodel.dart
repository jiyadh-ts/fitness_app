 // lib/model/dietmodel.dart
import 'package:hive/hive.dart';

part 'dietmodel.g.dart';

@HiveType(typeId: 2)
class Dietmodel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? type;

  @HiveField(2)
  String? breakfastMeal;

  @HiveField(3)
  int? breakfastCalories;

  @HiveField(4)
  String? lunchMeal;

  @HiveField(5)
  int? lunchCalories;

  @HiveField(6)
  String? dinnerMeal;

  @HiveField(7)
  int? dinnerCalories;

  Dietmodel({
    this.id,
    this.type,
    this.breakfastMeal,
    this.breakfastCalories,
    this.lunchMeal,
    this.lunchCalories,
    this.dinnerMeal,
    this.dinnerCalories,
  });
}
