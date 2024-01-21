import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../Model/home_model.dart';
import '../../Service/FireBase/get_details.dart';
import '../../Views/Home/home_page_view.dart';

class HomePageViewModel extends BaseViewModel {
  String name = '';

  // final RealEstateService _realEstateService;
  int page = 0;
  PageController pageController = PageController();

  onTapped(int value) {
    page = value;
    pageController.jumpToPage(value);
    notifyListeners();
  }

  onChangedPage(value) {
    page = value;
    pageController.jumpToPage(value);
    notifyListeners();
  }

  final List<ListedProperty> _properties = const [
    ListedProperty(
      id: '090917290381',
      address: 'Plot 10 salaam estate',
      imageURL: 'images/intro1.png',
      price: 500000,
      isRented: true,
      useFor: 'Rent',
    ),
    ListedProperty(
      id: '090917290381',
      address: 'Plot 10 assalam estate',
      imageURL: 'images/intro1.png',
      price: 500000,
      isRented: true,
      useFor: 'Rent',
    ),
    ListedProperty(
      id: '090917290381',
      address: 'Plot 10 assalam estate',
      imageURL: 'images/intro1.png',
      price: 500000,
      isRented: true,
      useFor: 'Rent',
    ),
    ListedProperty(
      id: '090917290381',
      address: 'Plot 10 assalam estate',
      imageURL: 'images/intro1.png',
      price: 500000,
      isRented: false,
      useFor: 'Rent',
    ),
  ];
  final bool _isLoading = false;

  List<ListedProperty> get properties => _properties;

  bool get isLoading => _isLoading;

  Future<void> loadProperties() async {}

  void navigateToHomes(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePageView(),
        ));
  }

  void navigateToPropertyDetails(ListedProperty property) {
    // Navigate to PropertyDetailsView with `property` as argument
  }

  onBuild() async {
    name = await getUserDetails('firstName');
    notifyListeners();
  }
}
