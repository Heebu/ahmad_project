import 'package:ahmad_project/Views/IntroScreenView/sign_up_view.dart';
import 'package:ahmad_project/Views/splash_screen.dart';
import 'package:flutter/cupertino.dart';

import '../Views/Home/home_page_view.dart';
import '../Views/IntroScreenView/intro_view.dart';
import '../Views/IntroScreenView/login_view.dart';
import '../Views/IntroScreenView/reset_password_view.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const FancySplashScreen(),
  '/home': (context) => const HomeView(),
  '/intro': (context) => const IntroView(),
  '/login': (context) => const LoginView(),
  '/signup': (context) => const SignupView(),
  '/resetPassword': (context) => const ResetPasswordView(),
};