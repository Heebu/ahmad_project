import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../Model/intro_screen_model.dart';

class IntroViewModel extends BaseViewModel {
  PageController pageController = PageController();

  final List<IntroScreenItem> introItems = const [
    IntroScreenItem(
      title: 'Find Your Dream Home',
      description:
          'Browse through a vast collection of properties, from cozy apartments to luxurious estates. Use our powerful search filters to narrow down your options and find homes that match your criteria.',
      imagePath: 'images/intro1.png',
    ),
    IntroScreenItem(
      title: 'Effortless Search',
      description:
          'Set up your personalized profile to receive tailored recommendations based on your preferences. The more information you provide, the better we can assist you in finding the ideal property.',
      imagePath: 'images/intro3.png',
    ),
    IntroScreenItem(
      title: 'Direct Communication',
      description:
          'Receive insights and market trends personalized to your preferences. Stay ahead of the curve and make informed decisions.',
      imagePath: 'images/intro2.png',
    ),
  ];

  int _currentPage = 0;

  int get currentPage => _currentPage;

  isChanged(value) {
    _currentPage = value;
    notifyListeners();
  }

  void nextPage() {
    if (_currentPage < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    }
  }

  void previousPage() {
    if (_currentPage > 1) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    }
  }

  void skipIntro() {
    pageController.jumpToPage(2);
  }

  void getStarted(context) {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
