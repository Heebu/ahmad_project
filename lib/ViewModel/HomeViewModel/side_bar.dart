import 'package:stacked/stacked.dart';

import '../../Model/sign_up_model.dart';

class ProfileViewModel extends BaseViewModel {
  //final UserService _userService;

  late User _user;

  User? get user => _user;

  Future<User> getUserProfile() async {
    User users = User(
        email: 'ayblazz@gmail.com',
        password: '123456789',
        name: 'Adedeji Idris',
        phone: '08112006431');
    // if (_user == null) {
    //   _user = await _userService.getCurrentUser();
    //   notifyListeners();
    // }
    return users;
  }

  void navigateToProfileEdit() {
    // Navigate to ProfileEditView
  }

  void navigateToSettings() {
    // Navigate to SettingsView
  }

  void navigateToHelp() {
    // Navigate to HelpView
  }

  void navigateToAbout() {
    // Navigate to AboutView
  }

  void navigateToFAQ() {
    // Navigate to FAQView
  }
}
