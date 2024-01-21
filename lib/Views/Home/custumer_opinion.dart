import 'package:ahmad_project/Views/Home/SelectCommercial/commercials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'SelectLand/lands.dart';
import 'SelectResident/residents.dart';

class Opinion extends StatelessWidget {
  const Opinion({super.key, required this.title, required this.image});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        child: Column(
          children: [
            Container(
              child: Container(
                height: 200.h,
                child: Image.asset(image, fit: BoxFit.contain),
              ),
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
            if (title == 'Lands')
              Text(
                'Land is considered real estate or property defined by specific borders. It can serve a commercial purpose and be seen as a factor of production. And it can serve a residential purpose, supporting people with shelter and other buildings and attachments.',
                textAlign: TextAlign.center,
              ),
            if (title == 'Residents')
              Text(
                'Housing" refers to the provision of shelter or living accommodations for individuals or groups. It encompasses a broad spectrum of dwellings, ranging from single-family homes to apartment buildings and various other types of residential structures. Here are key aspects of housing',
                textAlign: TextAlign.center,
              ),
            if (title == 'Commercials')
              Text(
                'A conferen ce hall is a dedicated space designed for holdingmeetings, conferences,seminars, workshops, and other events where a large number of people gatherto discuss, present, or exchange information',
                textAlign: TextAlign.center,
              ),
            SizedBox(
              height: 30.h,
            ),
            if (title == 'Lands')
              Column(
                children: [
                  MyListTile(
                      title: 'Agriculutral Land',
                      widget: Lands(),
                      action: 'Buy'),
                  MyListTile(
                      title: 'Residential Land',
                      widget: Lands(),
                      action: 'Buy'),
                  MyListTile(
                      title: 'Commercial Land', widget: Lands(), action: 'Buy'),
                ],
              ),
            if (title == 'Residents')
              Column(
                children: [
                  MyListTile(
                      title: 'Bungalow', widget: Residents(), action: 'Rent'),
                  MyListTile(
                      title: 'Duplex', widget: Residents(), action: 'Rent'),
                  MyListTile(
                      title: 'Mansion', widget: Residents(), action: 'Rent'),
                  MyListTile(
                      title: 'Town House', widget: Residents(), action: 'Rent'),
                ],
              ),
            if (title == 'Commercials')
              Column(
                children: [
                  MyListTile(
                      title: 'Conference Hall 100 seaters',
                      widget: Commercials(),
                      action: 'Rent'),
                  MyListTile(
                      title: 'Conference Hall 500 seaters',
                      widget: Commercials(),
                      action: 'Rent'),
                  MyListTile(
                      title: 'Conference Hall 1000 seaters',
                      widget: Commercials(),
                      action: 'Rent'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.title,
    required this.widget,
    required this.action,
  });

  final String title;
  final String action;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: ListTile(
        tileColor: Colors.blue.shade900,
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => widget,
                ));
          },
          child: Text(action),
        ),
      ),
    );
  }
}
