import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../Model/intro_screen_model.dart';

class IntroViewModel extends BaseViewModel {
  PageController pageController = PageController();

  final List<IntroScreenItem> introItems = const [
    IntroScreenItem(
      title: 'Find Your Dream Home',
      description: 'Explore a wide range of apartments and houses for rent or purchase.',
      imagePath: 'images/intro1.png',
    ),
    IntroScreenItem(
      title: 'Effortless Search',
      description: 'Filter listings by location, price, size, and amenities to find your perfect match.',
      imagePath: 'images/intro3.png',
    ),
    IntroScreenItem(
      title: 'Direct Communication',
      description: 'Connect directly with landlords or sellers through secure in-app messaging.',
      imagePath: 'images/intro2.png',
    ),
  ];

  int _currentPage = 0;

  int get currentPage => _currentPage;

  isChanged (value) {
    _currentPage = value;
    notifyListeners();
  }

  void nextPage() {
    if (_currentPage <2 ) {
     pageController.nextPage(duration: const Duration(milliseconds: 100),
       curve: Curves.linear,);
    }
  }

  void skipIntro() {
    pageController.jumpToPage(2);
  }

   void getStarted(context) {
     Navigator.pushReplacementNamed(context, '/login');
  }
}
