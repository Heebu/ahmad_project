import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherTemp extends StatelessWidget {
  const OtherTemp(
      {super.key,
      required this.title,
      required this.image,
      required this.text});

  final String title;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Column(
            children: [
              Container(
                height: 200.h,
                child: Image.asset(image),
              ),
              Text(title,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp)),
              Text(
                text,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
