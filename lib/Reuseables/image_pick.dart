import 'dart:io';

import 'package:ahmad_project/Reuseables/snack_bars.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

Future<String?> uploadImageToFirebase(context) async {
  final picker = ImagePicker();
  XFile? image;

  try {
    // Get image from device
    image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return null; // User canceled selection

    final Reference ref =
        FirebaseStorage.instance.ref().child('${DateTime.now()}.jpg');
    final UploadTask uploadTask = ref.putFile(File(image.path));

    TaskSnapshot? snapshot = await uploadTask
        .whenComplete(() => null); // Wait for upload to complete

    if (snapshot.state == TaskState.success) {
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } else {
      showSnackBar(context, 'Error uploading image');
      return null;
    }
  } on FirebaseException catch (e) {
    // Handle Firebase errors
    showSnackBar(context, e.message ?? 'Error uploading image');
    return null;
  } catch (e) {
    // Handle other errors
    showSnackBar(context, 'Error uploading image');
    return null;
  } finally {
    // Clean up - delete temporary image file (if it exists)
    if (image != null) {
      File(image.path).delete();
    }
  }
}
