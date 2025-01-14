import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/view/login__screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreenController with ChangeNotifier {
  var db = FirebaseFirestore.instance;

  Future onRegistration(
      {required String emailAddress,
      required String password,
      required BuildContext context}) async {
    // Basic client-side validation
    if (emailAddress.isEmpty || password.isEmpty) {
      showDialogError(context, 'Please fill in all fields.');
      return;
    }

    final data = {"emailid": emailAddress};

    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      await db.collection("FitnessAppUsers").add(data).then(
          (documentSnapshot) =>
              print("Added Data with ID: ${documentSnapshot.id}"));

      if (credential.user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('emailAddress', emailAddress);
        Navigator.pop(context); // Close loading indicator
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Close loading indicator
      if (e.code == 'weak-password') {
        showDialogError(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showDialogError(context, 'The account already exists for that email.');
      }
    } catch (e) {
      Navigator.pop(context); // Close loading indicator
      showDialogError(
          context, 'An unexpected error occurred. Please try again.');
      print(e);
    }
  }

  void showDialogError(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        });
  }
}
