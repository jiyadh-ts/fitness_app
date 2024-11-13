import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/controller/Registration_controller.dart';
import 'package:fitness_app/controller/login_controller.dart';
import 'package:fitness_app/model/cartmodel.dart';
import 'package:fitness_app/model/dietmodel.dart';
import 'package:fitness_app/view/splash_screen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (_) => RegistrationScreenController()),
        ChangeNotifierProvider(create: (_) => LoginScreenController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    );
  }
}
