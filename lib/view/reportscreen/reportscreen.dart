import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:fitness_app/controller/Firebase_controller.dart';
import 'package:intl/intl.dart';

class Reportscreen extends StatefulWidget {
  const Reportscreen({super.key});

  @override
  State<Reportscreen> createState() => _ReportscreenState();
}

class _ReportscreenState extends State<Reportscreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  late String email;

  String _bmiResult = '';
  double _bmiValue = 0.0;
  double _progress = 0.0;
  Color _progressColor = Colors.grey;

  final FirebaseController _firebaseController = FirebaseController();
  List<Map<String, dynamic>> _workoutDetails = [];

  @override
  @override
  void initState() {
    super.initState();
    _loadEmailAndFetchWorkouts();
  }

  Future<void> _loadEmailAndFetchWorkouts() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String loadedEmail = prefs.getString('emailAddress') ?? 'Unknown';

      if (!mounted) return; // Check if the widget is still mounted
      setState(() {
        email = loadedEmail;
      });

      // Fetch workout details after loading the email
      List<Map<String, dynamic>> details =
          await _firebaseController.getWorkoutDetails(emailId: loadedEmail);

      if (!mounted) return; // Check again before updating the state
      setState(() {
        _workoutDetails = details;
      });
    } catch (e) {
      if (!mounted) return; // Ensure setState is not called if unmounted
      print("Error loading email or fetching workout details: $e");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reports',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              calendarBuilders: CalendarBuilders(
                // Customize the day builder to add a cross mark
                defaultBuilder: (context, day, focusedDay) {
                  // Check if there's a workout on this day
                  bool isWorkoutDay = _workoutDetails.any((workout) {
                    DateTime workoutDate = DateTime.parse(workout["Date"]);
                    return isSameDay(workoutDate, day);
                  });

                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isWorkoutDay ? Colors.red.shade200 : null,
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          '${day.day}',
                          style: TextStyle(
                            color: isWorkoutDay ? Colors.white : Colors.black,
                          ),
                        ),
                        if (isWorkoutDay)
                          Icon(
                            Icons.cancel_outlined,
                            color: Colors.white,
                            size: 14,
                          ), // Cross mark icon
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _heightController,
                    decoration: InputDecoration(
                      labelText: 'Height (cm)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _weightController,
                    decoration: InputDecoration(
                      labelText: 'Weight (kg)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      double height =
                          double.tryParse(_heightController.text) ?? 0;
                      double weight =
                          double.tryParse(_weightController.text) ?? 0;

                      if (height > 0 && weight > 0) {
                        double heightInMeters = height / 100;
                        double bmi = weight / (heightInMeters * heightInMeters);
                        double progress = bmi / 40.0;

                        String result;
                        Color progressColor;

                        if (bmi < 18.5) {
                          result = 'Underweight';
                          progressColor = Colors.yellow;
                        } else if (bmi >= 18.5 && bmi < 24.9) {
                          result = 'Normal weight';
                          progressColor = Colors.green;
                        } else {
                          result = 'Overweight';
                          progressColor = Colors.red;
                        }

                        setState(() {
                          _bmiResult = result;
                          _bmiValue = bmi;
                          _progress = progress.clamp(0.0, 1.0);
                          _progressColor = progressColor;
                        });
                      } else {
                        setState(() {
                          _bmiResult = 'Please enter valid values';
                          _progress = 0.0;
                          _progressColor = Colors.grey;
                        });
                      }
                    },
                    child: Text('Check BMI'),
                  ),
                  SizedBox(height: 20),
                  LinearPercentIndicator(
                    lineHeight: 20.0,
                    percent: _progress,
                    backgroundColor: Colors.grey,
                    progressColor: _progressColor,
                    barRadius: Radius.circular(8.0),
                    center: Text(
                      _bmiResult,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    _bmiResult,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  SizedBox(height: 16),
                  Text(
                    'Your Workouts',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 16),
                  ..._workoutDetails.map((workout) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
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
                              padding: EdgeInsets.all(12),
                              child: Text(
                                "🔥", // Emoji for workout
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                            SizedBox(width: 16),
                            // Workout details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Date
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today,
                                          color: Colors.blue),
                                      SizedBox(width: 8),
                                      Text(
                                        workout["Date"] != null
                                            ? DateFormat('dd MMM yyyy').format(
                                                DateTime.parse(workout["Date"]))
                                            : "Unknown",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 8),
                                  // Time Taken
                                  Row(
                                    children: [
                                      Icon(Icons.timer, color: Colors.orange),
                                      SizedBox(width: 8),
                                      Text(
                                        "Time Taken: ${workout["timetaken"] ?? "Unknown"}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  // Calories Burnt
                                  Row(
                                    children: [
                                      Icon(Icons.local_fire_department,
                                          color: Colors.red),
                                      SizedBox(width: 8),
                                      Text(
                                        "Calories Burnt: ${workout["caloriesburnt"] ?? "Unknown"}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey[700]),
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
          ],
        ),
      ),
    );
  }
}
