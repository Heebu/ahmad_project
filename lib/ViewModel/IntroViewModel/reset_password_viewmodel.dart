import 'package:ahmad_project/Reuseables/snack_bars.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ResetPasswordViewModel extends BaseViewModel {
  //final FirebaseAuth _auth;

  String _email = '';

  String get email => _email;

  void updateEmail(String value) => _email = value;

  Future<void> requestPasswordReset(context) async {
    if (_email.isEmpty) {
      showSnackBar(context, 'Please enter your email address.');
    } else {
      showSnackBar(context, 'Password reset link sent');
      Navigator.pop(context);
    }

    // try {
    //   await _auth.sendPasswordResetEmail(_email);
    //   // Show success message and instructions
    // }
    //
    // on FirebaseAuthException catch (error) {
    //   // Handle Firebase authentication errors
    //   notifyListeners();
    // }
  }
}
