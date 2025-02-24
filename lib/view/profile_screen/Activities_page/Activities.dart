import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fitness_app/controller/Firebase_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  final FirebaseController _firebaseController = FirebaseController();
  List<Map<String, dynamic>> _workoutDetails = [];
  int _totalworkouts = 0;
  double _totalCaloriesBurnt = 0.0;

  @override
  void initState() {
    super.initState();
    _loadWorkoutDetails();
  }

  Future<void> _loadWorkoutDetails() async {
    try {
      // Replace with the appropriate user email fetching logic
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String loadedEmail = prefs.getString('emailAddress') ?? 'Unknown';
      List<Map<String, dynamic>> details =
          await _firebaseController.getWorkoutDetails(emailId: loadedEmail);

      double totalCalories = 0.0;
      for (var workout in details) {
        totalCalories += double.tryParse(workout['caloriesburnt'] ?? '0') ?? 0;
      }

      if (!mounted) return;

      setState(() {
        _workoutDetails = details;
        _totalCaloriesBurnt = totalCalories;
        _totalworkouts = details.length;
      });
    } catch (e) {
      print("Error fetching workout details: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Activities',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Summary",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.fitness_center, color: Colors.purple),
                        const SizedBox(width: 8),
                        Text(
                          "Total Workouts: $_totalworkouts",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.local_fire_department, color: Colors.red),
                        const SizedBox(width: 8),
                        Text(
                          "Total Calories Burnt: ${_totalCaloriesBurnt.toStringAsFixed(1)} kcal",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Workout Details",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 8),
            ..._workoutDetails.map((workout) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Emoji icon
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(12),
                        child: const Text(
                          "💪", // Emoji for activity
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_today, color: Colors.blue),
                                const SizedBox(width: 8),
                                Text(
                                  workout["Date"] != null
                                      ? DateFormat('dd MMM yyyy').format(
                                          DateTime.parse(workout["Date"]))
                                      : "Unknown",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.timer, color: Colors.orange),
                                const SizedBox(width: 8),
                                Text(
                                  "Time Taken: ${workout["timetaken"] ?? "Unknown"} min",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.local_fire_department,
                                    color: Colors.red),
                                const SizedBox(width: 8),
                                Text(
                                  "Calories Burnt: ${workout["caloriesburnt"] ?? "Unknown"} kcal",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
