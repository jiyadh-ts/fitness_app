// lib/screens/dietboxscreen.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fitness_app/model/dietmodel.dart';

class DietBoxScreen extends StatefulWidget {
  const DietBoxScreen({super.key});

  @override
  State<DietBoxScreen> createState() => _DietBoxScreenState();
}

class _DietBoxScreenState extends State<DietBoxScreen> {
  late Box<Dietmodel> dietBox;

  @override
  void initState() {
    super.initState();
    dietBox = Hive.box<Dietmodel>('dietBox');
  }

  double getTotalCalories() {
    double total = 0;
    for (var diet in dietBox.values) {
      total += (diet.breakfastCalories ?? 0) +
          (diet.lunchCalories ?? 0) +
          (diet.dinnerCalories ?? 0);
    }
    return total;
  }

  void removeDiet(int key) {
    dietBox.delete(key);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Diet removed from your plan.')),
    );
  }

  void clearDiets() {
    dietBox.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All diets cleared from your plan.')),
    );
  }

  void proceedWithDiets() {
    // Implement your Proceed functionality here
    // For example, finalize the diet plan and navigate back
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Diet plan finalized!')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Diet Plan'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            tooltip: 'Clear All Diets',
            onPressed: () {
              if (dietBox.isNotEmpty) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Clear All Diets'),
                    content: const Text(
                        'Are you sure you want to clear all diets from your plan?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          clearDiets();
                          Navigator.pop(context);
                        },
                        child: const Text('Clear'),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: dietBox.listenable(),
        builder: (context, Box<Dietmodel> box, _) {
          if (box.values.isEmpty) {
            return const Center(
              child: Text(
                "Your diet plan is empty",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final key = box.keyAt(index);
                    final Dietmodel? diet = box.get(key);

                    if (diet == null) return const SizedBox.shrink();

                    return Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Diet Type
                              Text(
                                diet.type ?? 'No Type',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              // Breakfast
                              Row(
                                children: [
                                  const Icon(Icons.breakfast_dining,
                                      color: Colors.orange),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Breakfast: ${diet.breakfastMeal ?? 'N/A'}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '${diet.breakfastCalories ?? 0} kcal',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              // Lunch
                              Row(
                                children: [
                                  const Icon(Icons.lunch_dining,
                                      color: Colors.green),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Lunch: ${diet.lunchMeal ?? 'N/A'}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '${diet.lunchCalories ?? 0} kcal',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              // Dinner
                              Row(
                                children: [
                                  const Icon(Icons.dinner_dining,
                                      color: Colors.blue),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Dinner: ${diet.dinnerMeal ?? 'N/A'}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '${diet.dinnerCalories ?? 0} kcal',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              // Total Calories for this diet
                              Text(
                                'Total Calories: ${(diet.breakfastCalories ?? 0) + (diet.lunchCalories ?? 0) + (diet.dinnerCalories ?? 0)} kcal',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton.icon(
                                  onPressed: () => removeDiet(key),
                                  icon: const Icon(Icons.delete),
                                  label: const Text('Remove'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Total Calories and Proceed Button
             
            ],
          );
        },
      ),
    );
  }
}
