import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuths {
  // Create a FirebaseAuth instance
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  String? userEmail = FirebaseAuth.instance.currentUser?.email;
  String? uid = FirebaseAuth.instance.currentUser?.uid;

  /// Firebase Sign Up
  Future<String> firebaseSignUp(String email, String password) async {
    String isCompleted = 'An unexpected error occurred';
    try {
      // Create a user with an email address and password
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential users = await auth.createUserWithEmailAndPassword(
            email: email, password: password);

        isCompleted = 'success';
      } else {
        isCompleted = 'Please fill in the email and password fields';
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Auth exceptions
      isCompleted = getErrorMessage(e);
    } catch (e) {
      // Handle other types of errors
      isCompleted = 'An unexpected error occurred';
    }
    return isCompleted;
  }

  /// Function to store user information
  Future<String> storeUserInfo(
    String firstName,
    String lastName,
    String phoneNumber,
    String image,
    String address,
  ) async {
    String result = 'An unexpected error occurred';
    if (firstName.isNotEmpty || lastName.isNotEmpty || phoneNumber.isNotEmpty) {
      try {
        final User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          final String uid = user.uid;
          await usersCollection.doc(uid).set({
            'firstName': firstName,
            'lastName': lastName,
            'phoneNumber': phoneNumber,
            'image': image,
            'addressLocation': address,
            'uid': uid,
          });
          result = 'success';
        }
      } on FirebaseAuthException catch (e) {
        // Handle specific Firebase Auth exceptions
        result = getErrorMessage(e);
      } catch (e) {
        result = e.toString();
      }
    } else {}
    return result;
  }

  ///sign in user
  Future<String> firebaseSignIn(String email, String password) async {
    String isSignedIn = 'An unexpected error occurred';

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      isSignedIn = 'success';
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Auth                                                   exceptions
      isSignedIn = getErrorMessage(e);
    } catch (e) {
      isSignedIn = e.toString();
    }
    return isSignedIn;
  }

  ///forgot password
  Future<String> firebaseForgotPassword(String email) async {
    String isSent = 'an unexpected error has occurred';

    if (email.isNotEmpty) {
      try {
        //send change password link
        await auth.sendPasswordResetEmail(email: email);
        isSent = 'success';
      } on FirebaseAuthException catch (e) {
        // Handle specific Firebase Auth exceptions
        isSent = getErrorMessage(e);
      } catch (e) {
        isSent = e.toString();
      }
    } else {
      //if email is empty

      isSent = 'Please fill in your email';
    }
    return isSent;
  }

  /// log out
  Future<String> firebaseSignOut(context) async {
    String isLoggedOut = 'An unexpected error occurred';
    try {
      //log out function
      await auth.signOut();
      Navigator.popUntil(context, (route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Auth exceptions
      isLoggedOut = getErrorMessage(e);
    } catch (e) {
      isLoggedOut = e.toString();
    }
    return isLoggedOut;
  }

  String getErrorMessage(e) {
    if (e is FirebaseAuthException) {
      if (e.code == 'user-not-found') {
        return 'User not found. Please check your email';
      } else if (e.code == 'wrong-password') {
        return 'Incorrect password';
      } else if (e.code == 'network-request-failed') {
        return 'Network request failed. Please check your internet connection';
      }
      return 'Firebase error: ${e.code}';
    }
    return 'An unexpected error occurred';
  }
}
