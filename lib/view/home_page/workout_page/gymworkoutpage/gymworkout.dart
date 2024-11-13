import 'package:flutter/material.dart';
import 'package:fitness_app/utils/colorconstraints.dart';
import 'package:fitness_app/view/home_page/workout_page/completionscreen/completion_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class GymWorkoutScreen extends StatefulWidget {
  final List<Map<String, dynamic>> workouts;
  final int initialIndex;

  const GymWorkoutScreen({
    Key? key,
    required this.workouts,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  State<GymWorkoutScreen> createState() => _GymWorkoutScreenState();
}

class _GymWorkoutScreenState extends State<GymWorkoutScreen> {
  late int currentIndex;
  late Map<String, dynamic> currentWorkout;
  int totalTimeInSeconds = 0;
  double caloriesBurned = 0.0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    currentWorkout = widget.workouts[currentIndex];
  }

  int _parseTimeToSeconds(int timePerSet) {
    return timePerSet;
  }

  double _calculateCalories(int totalSeconds, double caloriesPerMinute) {
    return (totalSeconds / 60) * caloriesPerMinute * 4;
  }

  void _goToNextWorkout() {
    if (currentIndex < widget.workouts.length - 1) {
      setState(() {
        currentIndex++;
        currentWorkout = widget.workouts[currentIndex];
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CompletionScreen(
            totalTimeInSeconds: totalTimeInSeconds * 4,
            caloriesBurned: caloriesBurned,
          ),
        ),
      );
    }
  }

  void _markWorkoutAsCompleted() {
    setState(() {
      int timeForWorkout = _parseTimeToSeconds(currentWorkout['timePerSet']);
      totalTimeInSeconds += timeForWorkout;
      caloriesBurned += _calculateCalories(
        timeForWorkout,
        currentWorkout['caloriesPerMinute'],
      );
    });
    _goToNextWorkout();
  }

  void _skipWorkout() {
    _goToNextWorkout();
  }

  void _openVideoLink() {
    final videoUrl = currentWorkout["video"];
    if (videoUrl != null && videoUrl.isNotEmpty) {
      // Use `launchUrl` from `url_launcher` package
      launchUrl(Uri.parse(videoUrl));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No video available for this workout")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String workoutName = currentWorkout["workoutName"] ?? "Workout";
    String reps = currentWorkout["reps"] ?? "";
    String sets = currentWorkout["sets"] ?? "";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorconstraints.Mainblue,
        title: Text(workoutName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.network(
                currentWorkout["image"] ??
                    "https://i.pinimg.com/originals/ac/a9/1f/aca91fc9bdb5a46f325ea2b145c62fea.jpg",
                fit: BoxFit.cover,
                height: 320,
                width: double.infinity,
              ),
              SizedBox(height: 20),
              Text(
                workoutName,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Reps: $reps | Sets: $sets',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 30),

              // Control Buttons: Video, Skip & Completed
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _openVideoLink,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Video',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _skipWorkout,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Skip',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _markWorkoutAsCompleted,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Completed',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
