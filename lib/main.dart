import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/controller/Firebase_controller.dart';
import 'package:fitness_app/controller/Registration_controller.dart';
import 'package:fitness_app/controller/login_controller.dart';
import 'package:fitness_app/model/cartmodel.dart';
import 'package:fitness_app/model/dietmodel.dart';
import 'package:fitness_app/view/bottomnavigation/bottomnavigationbar_page.dart';
import 'package:fitness_app/view/home_page/homepage.dart';
import 'package:fitness_app/view/login__screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter(); //step 1
  Hive.registerAdapter(CartmodelAdapter());
  Hive.registerAdapter(DietmodelAdapter());

  var box = await Hive.openBox<Cartmodel>("cartbox");
  await Hive.openBox<Dietmodel>("dietbox");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        ChangeNotifierProvider(create: (_) => FirebaseController()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return BottomNavbarScreen();
              } else {
                return LoginScreen();
              }
            },
          )),
    );
  }
}
