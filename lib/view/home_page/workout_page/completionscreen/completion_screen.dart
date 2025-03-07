import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/controller/Firebase_controller.dart';
import 'package:fitness_app/view/bottomnavigation/bottomnavigationbar_page.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/utils/colorconstraints.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompletionScreen extends StatefulWidget {
  final int totalTimeInSeconds;
  final double caloriesBurned;

  const CompletionScreen({
    Key? key,
    required this.totalTimeInSeconds,
    required this.caloriesBurned,
  }) : super(key: key);

  @override
  _CompletionScreenState createState() => _CompletionScreenState();
}

class _CompletionScreenState extends State<CompletionScreen> {
  late String email;
  final FirebaseController firebaseController = FirebaseController();

  @override
  void initState() {
    super.initState();
    _loadEmailFromPreferences();
  }

  Future<void> _loadEmailFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = (prefs.getString('emailAddress') ?? 'Unknown');
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes}m ${remainingSeconds}s';
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = _formatTime(widget.totalTimeInSeconds);
    String formattedCalories = widget.caloriesBurned.toStringAsFixed(1);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorconstraints.Mainblue,
        title: Text('Congratulations!'),
        automaticallyImplyLeading: false, // Removes the back button
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success Animation
              Lottie.asset(
                'Assets/animations/Animation - 1724055717710 (2).json', // Update with your animation file
                width: 200,
                height: 200,
                repeat: false,
              ),
              SizedBox(height: 30),

              Text(
                'Congratulations!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colorconstraints.Mainblue,
                ),
              ),
              SizedBox(height: 20),

              // Total Time
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.timer, color: Colorconstraints.Mainblue),
                  SizedBox(width: 10),
                  Text(
                    'Total Time: $formattedTime',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Calories Burned
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.local_fire_department, color: Colors.redAccent),
                  SizedBox(width: 10),
                  Text(
                    'Calories Burned: $formattedCalories kcal',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),

              // Button to Go Back or Restart
              ElevatedButton(
                onPressed: () async {
                  // Use the email retrieved from SharedPreferences
                  await firebaseController.addWorkoutDetails(
                    emailId: email,
                    workoutData: {
                      "Date": DateTime.now().toIso8601String(),
                      "timetaken": formattedTime,
                      "caloriesburnt": formattedCalories,
                    },
                  );

                  // Navigate back to Home or Restart Workout
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (context) => BottomNavbarScreen())
                  );  // Update route as needed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colorconstraints.Mainblue,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Go to Home',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
