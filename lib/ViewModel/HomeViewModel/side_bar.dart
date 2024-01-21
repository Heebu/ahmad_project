import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../Model/users_model.dart';
import '../../Reuseables/image_pick.dart';
import '../../Service/FireBase/firebase_auth.dart';
import '../../Service/FireBase/get_details.dart';
import '../../Views/Home/SideBar/profile.view.dart';

class ProfileViewModel extends BaseViewModel {
  String name = '';
  late UsersModel _user;
  String image = '';

  UsersModel get user => _user;

  Future<UsersModel> getUserProfile() async {
    String firstname = await getUserDetails('firstName');
    String lastName = await getUserDetails('lastName');
    image = await getUserDetails('image');
    String phone = await getUserDetails('phoneNumber');
    String state = await getUserDetails('addressLocation');
    String? email = FirebaseAuths().userEmail;
    name = '$firstname $lastName';

    UsersModel users = UsersModel(
        email: email ?? '',
        firstName: firstname ?? '',
        lastName: lastName ?? '',
        phone: phone ?? '',
        state: state ?? '',
        image: image ?? '');
    return users;
  }

  void navigateToProfileEdit(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileView(),
        ));
    // Navigate to ProfileEditView
  }

  imagePic(context) async {
    String? newImage = await uploadImageToFirebase(context);
    if (newImage != null) {
      image = newImage;
    }
    notifyListeners();
  }

  void navigateToScreen(context, widget) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }

  void logOutFunction(context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Log Out'),
              content: Text('Would you like to log out from this account?'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      FirebaseAuths().firebaseSignOut(context);
                    },
                    child: Text('Out'))
              ],
            ));
  }
}
