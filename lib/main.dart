import 'package:fitness_app/model/cartmodel.dart';
import 'package:fitness_app/model/dietmodel.dart';
import 'package:fitness_app/view/splash_screen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); //step 1
  Hive.registerAdapter(CartmodelAdapter());
  Hive.registerAdapter(DietmodelAdapter());

  var box = await Hive.openBox<Cartmodel>("cartbox");
  await Hive.openBox<Dietmodel>("dietbox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
  home: Splashscreen(),
    );
  }
}
