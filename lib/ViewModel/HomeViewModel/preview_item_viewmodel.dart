import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:stacked/stacked.dart';

import '../../Reuseables/snack_bars.dart';

class PreviewItemViewModel extends BaseViewModel {
  final PaystackPlugin _paystackPlugin = PaystackPlugin();
  final User? user = FirebaseAuth.instance.currentUser;
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiringDateController = TextEditingController();
  TextEditingController cvvNumberController = TextEditingController();

  Future<void> pay(context, int amount) async {
    setBusy(true);
    String? email = user?.email;

    try {
      Charge charge = Charge()
        ..amount = (amount + 100) * 100
        ..email = email
        ..reference = TimeOfDay.now().toString()
        ..currency = 'Naira';
      // ..transactionCharge = 10 * 100;

      // Initialize the payment.
      CheckoutResponse response = await _paystackPlugin.checkout(
        context,
        charge: charge,
        method: CheckoutMethod.card,
      );

      // Check the response.
      if (response.status == true) {
        updateOrders();
        showSnackBar(context, 'Payment Successful');
      } else {
        // Payment failed.
        showSnackBar(context,
            'Transaction failed. Please contact our customer care if this persist');
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    } finally {
      setBusy(false);
    }
  }

  void initializePaystack() {
    _paystackPlugin.initialize(
      //sk_live_378ec7632ca0ce8ef3e6a23b50ec1ceb07fefb8f
      publicKey: 'pk_test_69edecd698e125d8e62aeef959741fa0d43622b4',
    );
  }

  void updateOrders() async {
    // if (user != null) {
    //   CollectionReference ordersCollection =
    //       FirebaseFirestore.instance.collection('orders');
    //
    //   QuerySnapshot<Object?> ordersSnapshot = await ordersCollection
    //       .where('paid', isEqualTo: false)
    //       .where('uid', isEqualTo: user!.uid)
    //       .get();
    //
    //   List<QueryDocumentSnapshot<Object?>> ordersDocs = ordersSnapshot.docs;
    //
    //   for (var doc in ordersDocs) {
    //     await ordersCollection.doc(doc.id).update({'paid': true});
    //   }
    // }
  }
}
