import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../ViewModel/IntroViewModel/intro_viewmodel.dart';

class IntroView extends StatelessWidget {

  const IntroView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(viewModelBuilder: () => IntroViewModel(),
      builder: (context, viewModel, child) {
      return Scaffold(
        body: PageView.builder(
          controller: viewModel.pageController,
          onPageChanged: (value) {
            viewModel.isChanged(value);
          },
          itemCount: viewModel.introItems.length,
          itemBuilder: (context, index) {
            final item = viewModel.introItems[index];
            return Stack(
              children: [
                Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(item.imagePath), fit: BoxFit.cover),),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        item.title,
                        style:  TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        item.description,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),

                  ],
                ),
                Align(
                  alignment: const Alignment(0, 0.9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (index <= 1)
                        ElevatedButton(
                          onPressed: viewModel.nextPage,
                          child: const Text('Next'),
                        ),

                      index == 2 ?
                      ElevatedButton(
                        onPressed: (){
                          viewModel.getStarted(context);
                        },
                        child: const Text('Get Started'),
                      ):
                      ElevatedButton(
                        onPressed: viewModel.skipIntro,
                        child: const Text('Skip'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
    },);
  }
}
