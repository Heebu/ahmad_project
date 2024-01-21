import 'package:ahmad_project/Reuseables/snack_bars.dart';
import 'package:ahmad_project/Service/FireBase/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  //final AuthenticationService _authService;
  bool isLoading = false;

  String _email = '';
  String _password = '';

  String get email => _email;

  String get password => _password;

  void updateEmail(String value) => _email = value;

  void updatePassword(String value) => _password = value;

  void login(context) async {
    isLoading = true;
    if (email.isNotEmpty || password.isNotEmpty) {
      try {
        String result =
            await FirebaseAuths().firebaseSignIn(email.trim(), password.trim());
        if (result == 'success') {
          isLoading = false;
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          showSnackBar(context, result);
          isLoading = false;
        }
        isLoading = false;
      } catch (e) {
        isLoading = false;
        showSnackBar(context, e.toString());
      }
    } else {
      isLoading = false;
      showSnackBar(context, 'Please fill all fields.');
    }
    isLoading = false;
    notifyListeners();
  }

  void resetPassword(context) {
    Navigator.pushNamed(context, '/resetPassword');
  }

  void createAccount(context) {
    Navigator.pushNamed(context, '/signup');
  }
}
