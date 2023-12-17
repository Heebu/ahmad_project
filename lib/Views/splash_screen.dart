import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
// import 'package:lottie/lottie.dart';

class FancySplashScreen extends StatefulWidget {
  const FancySplashScreen({Key? key}) : super(key: key);

  @override
  State<FancySplashScreen> createState() => _FancySplashScreenState();
}

class _FancySplashScreenState extends State<FancySplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 6));
    Navigator.pushReplacementNamed(context, '/intro');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

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

           // Lottie animation
           //  Lottie.asset(
           //    'images/Animation - 1702795164449.gif',
           //    repeat: true,
           //    width: 300,
           //    height: 300,
           //  ),

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
}
