import 'package:fitness_app/utils/imageconstraints.dart';
import 'package:fitness_app/view/home_page/workout_page/completionscreen/completion_screen.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:fitness_app/utils/colorconstraints.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkoutScreen extends StatefulWidget {
  final List<Map<String, dynamic>> workouts;
  final int initialIndex;

  const WorkoutScreen({
    Key? key,
    required this.workouts,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  late int currentIndex;
  late Map<String, dynamic> currentWorkout;
  final CountDownController _controller = CountDownController();
  bool isCompleted = false;

  // Variables to track total time and calories only for completed workouts
  int totalTimeInSeconds = 0;
  double caloriesBurned = 0.0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    currentWorkout = widget.workouts[currentIndex];
    _controller.start();
  }

  /// Parse time strings like '45s' or '1 min' to seconds
  int _parseTimeToSeconds(String timeStr) {
    timeStr = timeStr.toLowerCase().trim();
    if (timeStr.contains('min')) {
      int minutes = int.tryParse(timeStr.replaceAll(RegExp(r'[^0-9]'), '')) ?? 1;
      return minutes * 60;
    } else if (timeStr.contains('s')) {
      return int.tryParse(timeStr.replaceAll(RegExp(r'[^0-9]'), '')) ?? 30;
    }
    return 30; // Default duration
  }

  /// Calculate calories based on workout duration in seconds
  double calculateCalories(int durationInSeconds) {
    double caloriesPerMinute = 12.0;
    return (durationInSeconds / 60) * caloriesPerMinute;
  }

  void _completeWorkout() {
    setState(() {
      isCompleted = true;
      int durationInSeconds = _parseTimeToSeconds(currentWorkout["time"]);
      
      // Add time and calories only if the workout is completed
      totalTimeInSeconds += durationInSeconds;
      caloriesBurned += calculateCalories(durationInSeconds);
    });
    _goToNextWorkout();
  }

  void _skipWorkout() {
    setState(() {
      isCompleted = true;
    });
    _goToNextWorkout();
  }

  void _goToNextWorkout() {
    if (currentIndex < widget.workouts.length - 1) {
      setState(() {
        currentIndex++;
        currentWorkout = widget.workouts[currentIndex];
        isCompleted = false;
      });
      _controller.restart(duration: _parseTimeToSeconds(currentWorkout["time"]));
      _controller.start();
    } else {
      // Navigate to Completion Screen with total time and calories
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CompletionScreen(
            totalTimeInSeconds: totalTimeInSeconds,
            caloriesBurned: caloriesBurned,
          ),
        ),
      );
    }
  }

  void _restartTimer() {
    setState(() {
      isCompleted = false;
    });
    _controller.restart(duration: _parseTimeToSeconds(currentWorkout["time"]));
    _controller.start();
  }

  void _launchVideo() async {
    String videoUrl = currentWorkout['video'] ?? '';
    if (await canLaunchUrl(Uri.parse(videoUrl))) {
      await launchUrl(Uri.parse(videoUrl));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch video')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String workoutName = currentWorkout["workoutName"] ?? "Workout";
    String reps = currentWorkout["reps"] ?? "";
    String timeStr = currentWorkout["time"] ?? "30s";
    int durationInSeconds = _parseTimeToSeconds(timeStr);

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
              // Workout Image
              Image.network(
                currentWorkout["image"] ??
                    "https://i.pinimg.com/originals/ac/a9/1f/aca91fc9bdb5a46f325ea2b145c62fea.jpg",
                fit: BoxFit.cover,
                height: 280,
                width: double.infinity,
              ),
              SizedBox(height: 20),

              // Workout Details
              Text(
                workoutName,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              if (reps.isNotEmpty)
                Text(
                  reps,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                  ),
                ),
              SizedBox(height: 30),

              // Timer
              CircularCountDownTimer(
                duration: durationInSeconds,
                initialDuration: 0,
                controller: _controller,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                ringColor: Colors.grey[300]!,
                fillColor: Colorconstraints.Mainblue,
                backgroundColor: Colors.white,
                strokeWidth: 10.0,
                strokeCap: StrokeCap.round,
                textStyle: TextStyle(
                  fontSize: 33.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
                textFormat: CountdownTextFormat.S,
                isReverse: true,
                isReverseAnimation: false,
                isTimerTextShown: true,
                autoStart: true,
                onStart: () {
                  print('Countdown Started');
                },
                onComplete: _completeWorkout,
              ),
              SizedBox(height: 20),

              // Control Buttons: Skip, Restart, and Watch Video
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _skipWorkout,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Skip & Next',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _restartTimer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Restart',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _launchVideo,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Watch Video',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),

              // Completion Animation
              if (isCompleted)
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Lottie.asset(
                    'Assets/animations/animation1.json',
                    width: 150,
                    height: 150,
                    repeat: false,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
