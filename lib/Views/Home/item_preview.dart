import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../Reuseables/sendMessage.dart';
import '../../ViewModel/HomeViewModel/preview_item_viewmodel.dart';

class ItemPreview extends StatelessWidget {
  const ItemPreview(
      {super.key,
      required this.name,
      required this.price,
      required this.description,
      required this.location,
      required this.image,
      required this.isRent,
      required this.contact,
      required this.type});

  final String name;
  final String price;
  final String description;
  final String location;
  final String image;
  final String contact;
  final String type;
  final bool isRent;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.initializePaystack(),
      viewModelBuilder: () => PreviewItemViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              collapsedHeight: 100.h,
              expandedHeight: 400.h,
              actions: [],
              bottom: PreferredSize(
                  preferredSize: Size(
                    double.maxFinite,
                    50.h,
                  ),
                  child: Container(
                    height: 50.h,
                    width: double.maxFinite,
                    color: Colors.black38,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Center(
                        child: Text(
                      name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp),
                    )),
                  )),
              flexibleSpace: Container(
                height: 500.h,
                color: Colors.red,
                child: PageView(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      )),
                    ),
                  ],
                ),
              ),
              //toolbarHeight: 50,
            ),
            SliverToBoxAdapter(
              child: ConstrainedBox(
                constraints: BoxConstraints.loose(Size(double.maxFinite, 300)),
                //height: MediaQuery.sizeOf(context).height,

                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(children: [
                        Text(
                          'Property Type: ',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14.sp),
                        ),
                        Spacer(),
                        Text(
                          type,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12.sp),
                        )
                      ]),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text.rich(
                          textAlign: TextAlign.start,
                          TextSpan(
                              text: 'Description: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14.sp),
                              children: [
                                TextSpan(
                                  text: description,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12.sp),
                                )
                              ]),
                        ),
                      ),
                      Row(children: [
                        Text(
                          'Price: ',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14.sp),
                        ),
                        Spacer(),
                        Text(
                          '₦$price',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12.sp),
                        )
                      ]),
                      Row(children: [
                        Text(
                          'Location: ',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14.sp),
                        ),
                        Spacer(),
                        Text(
                          location,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12.sp),
                        )
                      ]),
                      Row(children: [
                        Text(
                          'Contact: ',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14.sp),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            sendMessage(
                                contact, name, isRent == true ? 'rent' : 'buy');
                          },
                          child: Text(
                            '+$contact',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 12.sp),
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          height: 50.h,
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
          child: GestureDetector(
            onTap: () async {
              //sendMessage(contact, name, isRent == true ? 'rent' : 'buy');
              await viewModel.pay(context, int.parse(price));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Center(
                child: Text(
                  isRent == true ? 'Rent' : 'Buy',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DescriptionListing extends StatelessWidget {
  const DescriptionListing({
    super.key,
    required this.text,
    required this.isAvailable,
  });

  final String text;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          Text(text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              )),
          const Spacer(),
          isAvailable
              ? Icon(
                  Icons.verified,
                  color: Colors.green,
                )
              : Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                ),
        ],
      ),
    );
  }
}
