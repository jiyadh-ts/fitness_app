import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseController with ChangeNotifier {
  var db = FirebaseFirestore.instance;

  Future<void> addWorkoutDetails({
    required String emailId,
    required Map<String, dynamic> workoutData,
  }) async {
    try {
      // Query to find the document with the matching email ID
      final querySnapshot = await db
          .collection("FitnessAppUsers")
          .where("emailid", isEqualTo: emailId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assuming there is only one document with the matching email ID
        final documentId = querySnapshot.docs.first.id;

        // Add data to the subcollection "workoutdetails" in the found document
        await db
            .collection("FitnessAppUsers")
            .doc(documentId)
            .collection("workoutdetails")
            .add(workoutData);

        print('Workout details added successfully.');
      } else {
        print('No user found with the provided email ID.');
      }
    } catch (e) {
      print('Failed to add workout details. Please try again.');
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>> getWorkoutDetails({
    required String emailId,
  }) async {
    try {
      // Query to find the document with the matching email ID
      final querySnapshot = await db
          .collection("FitnessAppUsers")
          .where("emailid", isEqualTo: emailId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assuming there is only one document with the matching email ID
        final documentId = querySnapshot.docs.first.id;

        // Retrieve data from the subcollection "workoutdetails" in the found document
        final workoutDetailsSnapshot = await db
            .collection("FitnessAppUsers")
            .doc(documentId)
            .collection("workoutdetails")
            .get();

        // Convert the data to a list of maps
        List<Map<String, dynamic>> workoutDetails = workoutDetailsSnapshot.docs
            .map((doc) => doc.data())
            .toList();

        print('Workout details retrieved successfully.');
        return workoutDetails;
      } else {
        print('No user found with the provided email ID.');
        return [];
      }
    } catch (e) {
      print('Failed to retrieve workout details. Please try again.');
      print(e);
      return [];
    }
  }
}
