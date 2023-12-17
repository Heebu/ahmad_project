import 'package:stacked/stacked.dart';

import '../../Model/home_model.dart';

class HomeViewModel extends BaseViewModel {
  // final RealEstateService _realEstateService;

  final List<ListedProperty> _properties = const [
    ListedProperty(
      id: '090917290381',
      address: 'Plot 10 salaam estate',
      imageURL: 'images/img.png',
      price: 500000,
      isRented: true,
    ),
    ListedProperty(
        id: '090917290381',
        address: 'Plot 10 assalam estate',
        imageURL: 'images/img.png',
        price: 500000,
        isRented: true),
  ];
  final bool _isLoading = false;

  List<ListedProperty> get properties => _properties;

  bool get isLoading => _isLoading;

  Future<void> loadProperties() async {
    // _isLoading = true;
    // notifyListeners();

    // try {
    //   _properties = await _realEstateService.getListedProperties();
    //   _isLoading = false;
    //   notifyListeners();
    // } on Exception catch (error) {
    //   // Handle error and show message
    //   _isLoading = false;
    //   notifyListeners();
    // }
  }

  void navigateToPropertyDetails(ListedProperty property) {
    // Navigate to PropertyDetailsView with `property` as argument
  }
}
