import 'package:ahmad_project/Reuseables/snack_bars.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  //final AuthenticationService _authService;

  String _email = '';
  String _password = '';

  String get email => _email;

  String get password => _password;

  void updateEmail(String value) => _email = value;

  void updatePassword(String value) => _password = value;

  void login(context) {
    if (_email.isNotEmpty || _password.isNotEmpty || _password.length > 7) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      showSnackBar(context, 'Please fill all fields.');
    }

    // try {
    //   await _authService.signInWithEmailAndPassword(_email, _password);
    //   // Navigate to your main app screen
    // } on FirebaseAuthException catch (error) {
    //   // Handle Firebase authentication errors
    //   notifyListeners();
    // }
  }

  void resetPassword(context) {
    Navigator.pushNamed(context, '/resetPassword');
  }

  void createAccount(context) {
    Navigator.pushNamed(context, '/signup');
  }
}
