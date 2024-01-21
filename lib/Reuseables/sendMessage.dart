import 'package:url_launcher/url_launcher.dart';

void sendMessage(String phoneNumber, String properties, String isRent) async {
  String url =
      "https://wa.me/$phoneNumber/?text=${Uri.encodeFull('I would like to $isRent this property named $properties')}";
  await launch(url);
}
