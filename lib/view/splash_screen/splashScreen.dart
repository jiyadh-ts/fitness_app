import 'package:fitness_app/utils/imageconstraints.dart';
import 'package:fitness_app/view/bottomnavigation/bottomnavigationbar_page.dart';
import 'package:fitness_app/view/home_page/homepage.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomNavbarScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(),
        child: Center(child: Image.asset(Imageconstraints.SplashScreen)),
      ),
    );
  }
}
