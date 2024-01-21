import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';

import '../../Model/properties_model.dart';

class HomeViewModel extends BaseViewModel {
  List<Product> products = [];

  Future<List<Product>> retrieveProductItems() async {
    final CollectionReference productsRef =
        FirebaseFirestore.instance.collection('Properties');

    final QuerySnapshot querySnapshot = await productsRef.get();

    List<Product> products = querySnapshot.docs.map((doc) {
      return Product.fromFirestore(doc);
    }).toList();

    return products;
  }

  Future<void> retrieveProducts() async {
    final retrievedProducts = await retrieveProductItems();
    products = retrievedProducts;
    notifyListeners();
  }
}
