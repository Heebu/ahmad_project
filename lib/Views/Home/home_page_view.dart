import 'package:ahmad_project/Views/Home/view_all_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../ViewModel/HomeViewModel/home_page_view_model.dart';
import 'SideBar/side_drawer.dart';
import 'custumer_opinion.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        onViewModelReady: (viewModel) => viewModel.onBuild(),
        builder: (context, viewModel, child) {
          return Scaffold(
              endDrawer: CustomDrawer(),
              appBar: AppBar(
                title: Text('Hi there, ${viewModel.name}'),
              ),
              body: Column(children: [
                Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/brand.png'),
                        fit: BoxFit.contain),
                    // color: Colors.purple,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  child: Column(
                    children: [
                      Divider(),
                      Row(
                        children: [
                          Spacer(),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ViewAllScreen(),
                                    ));
                              },
                              child: Text('View all properties'))
                        ],
                      ),
                      Container(
                        height: 80.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Opinion(
                                        title: 'Commercials',
                                        image: 'images/newCommercials.png',
                                      ),
                                    ));
                              },
                              child: CartButtons(
                                  title: 'Commarcial',
                                  image: 'images/commercalImage.png'),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Opinion(
                                        title: 'Residents',
                                        image: 'images/newResident.png',
                                      ),
                                    ));
                              },
                              child: CartButtons(
                                  title: 'Residential',
                                  image: 'images/residentialImage.png'),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Opinion(
                                          title: 'Lands',
                                          image: 'images/newLand.png'),
                                    ));
                              },
                              child: CartButtons(
                                  title: 'Land', image: 'images/landImage.png'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ]));
        });
  }
}

class CartButtons extends StatelessWidget {
  const CartButtons({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 110.w,
      //padding: EdgeInsets.symmetric(horizontal: 5.h),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 1, spreadRadius: 0, offset: Offset(-1, 1))
          ],
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
            opacity: .7,
          )),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp)),
      ),
    );
  }
}

class SelectionWidget extends StatelessWidget {
  const SelectionWidget({
    super.key,
    required this.text,
    required this.size,
    required this.fontWeight,
  });

  final String text;
  final double size;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size.sp,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

//  GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const HomeView(),
//                               ));
//                         },
//                         child: Container(
//                           height: 300.h,
//                           decoration: BoxDecoration(
//                               border: Border.all(color: Colors.grey.shade400),
//                               borderRadius: BorderRadius.circular(20.r),
//                               image: DecorationImage(
//                                   image: AssetImage('images/home.png'))),
//                         ),
//                       ),
//                       SelectionWidget(
//                         text: 'Home',
//                         size: 16,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const Commercials(),
//                               ));
//                         },
//                         child: HomeButtons(
//                           name: 'Commercial',
//                           imagePath: 'images/commercials.png',
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const Residents(),
//                               ));
//                         },
//                         child: HomeButtons(
//                           name: 'Resident',
//                           imagePath: 'images/resident.png',
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const Lands(),
//                               ));
//                         },
//                         child: HomeButtons(
//                           name: 'Land',
//                           imagePath: 'images/land.png',
//                         ),
//                       ),
//                     ],
//                   )
