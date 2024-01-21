import 'package:ahmad_project/Reuseables/snack_bars.dart';
import 'package:ahmad_project/Service/FireBase/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ResetPasswordViewModel extends BaseViewModel {
  bool isLoading = false;
  String _email = '';

  String get email => _email;

  void updateEmail(String value) => _email = value;

  Future<void> requestPasswordReset(context) async {
    isLoading = true;
    if (_email.isEmpty) {
      isLoading = false;
      showSnackBar(context, 'Please enter your email address.');
    } else {
      try {
        String result =
            await FirebaseAuths().firebaseForgotPassword(email.trim());
        if (result == 'success') {
          showSnackBar(context, 'Password reset link sent');
          isLoading = false;
          Navigator.pop(context);
        } else {
          showSnackBar(context, result);
          isLoading = false;
        }
      } catch (e) {
        showSnackBar(context, e.toString());
        isLoading = false;
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
