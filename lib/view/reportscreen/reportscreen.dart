import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:percent_indicator/percent_indicator.dart';

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

  String _bmiResult = '';
  double _bmiValue = 0.0;
  double _progress = 0.0;
  Color _progressColor = Colors.grey;

  @override
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
                    // width: 510,
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
