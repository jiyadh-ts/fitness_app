// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAnd_H4D4bZ3P-T2jyly0_y16PpkFpXqzI',
    appId: '1:28853040901:web:885f915298802d1082296c',
    messagingSenderId: '28853040901',
    projectId: 'sample-e8c21',
    authDomain: 'sample-e8c21.firebaseapp.com',
    storageBucket: 'sample-e8c21.appspot.com',
    measurementId: 'G-BB31NJ2D88',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAm2IOeCRlza7YbVfIYQ8Ydi3fhZf9g2Ug',
    appId: '1:28853040901:android:72844b4e41f6b8f482296c',
    messagingSenderId: '28853040901',
    projectId: 'sample-e8c21',
    storageBucket: 'sample-e8c21.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqIMg7iZy-7Vw9NrpEARQPJJ83un4w9cU',
    appId: '1:28853040901:ios:08e462975b1df9e682296c',
    messagingSenderId: '28853040901',
    projectId: 'sample-e8c21',
    storageBucket: 'sample-e8c21.appspot.com',
    iosBundleId: 'com.example.fitnessApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqIMg7iZy-7Vw9NrpEARQPJJ83un4w9cU',
    appId: '1:28853040901:ios:08e462975b1df9e682296c',
    messagingSenderId: '28853040901',
    projectId: 'sample-e8c21',
    storageBucket: 'sample-e8c21.appspot.com',
    iosBundleId: 'com.example.fitnessApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAnd_H4D4bZ3P-T2jyly0_y16PpkFpXqzI',
    appId: '1:28853040901:web:8040fd6640a159c682296c',
    messagingSenderId: '28853040901',
    projectId: 'sample-e8c21',
    authDomain: 'sample-e8c21.firebaseapp.com',
    storageBucket: 'sample-e8c21.appspot.com',
    measurementId: 'G-N078XCP3Y5',
  );
}
