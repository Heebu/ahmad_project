import 'package:ahmad_project/Service/FireBase/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> getUserDetails(String field) async {
  String? uid = FirebaseAuths().uid;
  String result = '';
  try {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    result = snapshot[field];
  } catch (e) {
    print(e.toString());
  }
  return result;
}

Future<String> updateUserName(String field, String newName) async {
  String? uid = FirebaseAuths().uid;
  String result = '';
  try {
    // Update user's name in Firebase
    await FirebaseFirestore.instance
        .collection('users')
        .doc(
            uid) // Replace 'userId' with the user's ID or a variable storing it
        .update({field: newName});
    result = 'success'; // Replace 'name' with your field name
  } catch (e) {
    result = e.toString();
  }
  return result;
}
