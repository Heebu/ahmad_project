import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignupViewModel extends BaseViewModel {
  //final AuthenticationService _authService;

  String _email = '';
  String _password = '';
  String _name = '';
  String _phone = '';

  String get email => _email;

  String get password => _password;

  String get name => _name;

  String get phone => _phone;

  void updateEmail(String value) => _email = value;

  void updatePassword(String value) => _password = value;

  void updateName(String value) => _name = value;

  void updatePhone(String value) => _phone = value;

  Future<void> signup(context) async {
    if (_email.isEmpty ||
        _password.isEmpty ||
        _name.isEmpty ||
        _phone.isEmpty) {
      throw Exception('Please fill all fields.');
    }
    Navigator.pushReplacementNamed(context, '/home');

    //   try {
    //     await _authService.createUserWithEmailAndPassword(_email, _password);
    //     // Save additional user details to your database
    //     // Navigate to your main app screen
    //   } on FirebaseAuthException catch (error) {
    //     // Handle Firebase authentication errors
    //     notifyListeners();
    //   }
  }
}
