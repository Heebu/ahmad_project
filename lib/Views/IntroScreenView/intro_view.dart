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
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => IntroViewModel(),
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100.h,
                        width: 100.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(item.imagePath))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          item.description,
                          style: TextStyle(
                              //color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        index > 0 && index < 3
                            ? IconButton(
                                onPressed: () {
                                  viewModel.previousPage();
                                },
                                icon: const Icon(Icons.arrow_back_ios),
                              )
                            : const SizedBox.shrink(),
                        index <= 1
                            ? IconButton(
                                onPressed: viewModel.nextPage,
                                icon: Icon(Icons.arrow_forward_ios),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.9, -0.9),
                    child: index != 2
                        ? ElevatedButton(
                            onPressed: viewModel.skipIntro,
                            child: const Text('Skip'),
                          )
                        : const SizedBox.shrink(),
                  ),
                  Align(
                    alignment: Alignment(0, 0.8),
                    child: index == 2
                        ? ElevatedButton(
                            onPressed: () {
                              viewModel.getStarted(context);
                            },
                            child: const Text('Continue Here'),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
