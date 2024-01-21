import 'package:ahmad_project/Reuseables/snack_bars.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../Model/users_model.dart';
import '../../Reuseables/image_pick.dart';
import '../../Service/FireBase/firebase_auth.dart';
import '../../Service/FireBase/get_details.dart';

class EditProfileViewModel extends BaseViewModel {
  late UsersModel _user;
  bool isLoading = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressLocationController = TextEditingController();

  String firstName = '';
  String lastName = '';
  String image = '';
  String phone = '';
  String state = '';
  String? email = '';

  UsersModel get user => _user;

  Future<UsersModel> getUserProfile() async {
    firstName = await getUserDetails('firstName');
    lastName = await getUserDetails('lastName');
    image = await getUserDetails('image');
    phone = await getUserDetails('phoneNumber');
    state = await getUserDetails('addressLocation');
    email = FirebaseAuths().userEmail;
    // name = '$firstname $lastName';

    UsersModel users = UsersModel(
        email: email ?? '',
        firstName: firstName ?? '',
        lastName: lastName ?? '',
        phone: phone ?? '',
        state: state ?? '',
        image: image ?? '');
    notifyListeners();
    return users;
  }

  imagePic(context) async {
    String? newImage = await uploadImageToFirebase(context);
    if (newImage != null) {
      image = newImage;
    }
    notifyListeners();
  }

  updateProfile(context) async {
    isLoading = true;
    try {
      if (firstNameController.text != firstName &&
          firstNameController.text != '') {
        updateUserName('firstName', firstNameController.text);
      }
      if (lastNameController.text != lastName &&
          lastNameController.text != '') {
        updateUserName('lastName', lastNameController.text);
      }
      if (phoneNumberController.text != phone &&
          phoneNumberController.text != '') {
        updateUserName('phoneNumber', phoneNumberController.text);
      }
      if (addressLocationController.text != state &&
          addressLocationController.text != '') {
        updateUserName('addressLocation', addressLocationController.text);
      }
      isLoading = false;
      showSnackBar(context, 'changes will be effected ASAP');
      Navigator.pop(context);
    } catch (e) {
      showSnackBar(context, e.toString());
      isLoading = false;
    }
    isLoading = false;
  }
}
