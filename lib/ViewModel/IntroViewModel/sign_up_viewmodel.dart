import 'package:ahmad_project/Reuseables/snack_bars.dart';
import 'package:ahmad_project/Service/FireBase/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../Reuseables/image_pick.dart';

class SignupViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String image = '';
  bool isLoading = false;

  void imagePicked(context) async {
    String? imageUsed = await uploadImageToFirebase(context);
    if (imageUsed != null) {
      image = imageUsed;
      notifyListeners();
    }
  }

  Future<void> signup(context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String phoneNumber = phoneNumberController.text.trim();
    String state = stateController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty ||
        password.isEmpty ||
        firstName.isEmpty ||
        lastName.isEmpty ||
        password.isEmpty ||
        state.isEmpty) {
      showSnackBar(context, 'Please fill all fields.');
    } else if (password != confirmPassword) {
      showSnackBar(context, 'Please retype the pass words to match');
    } else {
      isLoading = true;
      try {
        String result = await FirebaseAuths().firebaseSignUp(email, password);
        if (result == 'success') {
          String newResult = await FirebaseAuths()
              .storeUserInfo(firstName, lastName, phoneNumber, image, state);
          if (newResult == 'success') {
            Navigator.pushReplacementNamed(context, '/home');
            isLoading = false;
          }
          showSnackBar(context, result);
          isLoading = false;
        } else {
          showSnackBar(context, result);
          isLoading = false;
        }
      } catch (e) {
        showSnackBar(context, e.toString());
        isLoading = false;
      }
    }
  }
}
