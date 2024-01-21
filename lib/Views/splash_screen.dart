import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Home/home_page_view.dart';
import 'IntroScreenView/intro_view.dart';

class FancySplashScreen extends StatelessWidget {
  const FancySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Colors.green,
            body: Center(
              child: Stack(
                children: [
                  // Animated gradient background
                  AnimatedContainer(
                    duration: const Duration(seconds: 5),
                    curve: Curves.bounceInOut,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.deepPurple,
                          Colors.deepPurpleAccent,
                          Colors.purple,
                          Colors.purpleAccent,
                        ],
                      ),
                    ),
                  ),

                  // App logo and name
                  Positioned(
                    bottom: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/brand.png', width: 100),
                        Text(
                          'Rent & Sell Smart',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        if (snapshot.hasData && snapshot.data != null) {
          // User is logged in, show home screen
          return const HomePageView();
        } else {
          // User is not logged in, show login screen
          return const IntroView();
        }
      },
    );
  }
}
