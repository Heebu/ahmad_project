import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Reuseables/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ScreenUtilInit(
        designSize: const Size(411.42857142857144, 683.4285714285714),
        minTextAdapt: true,
        ensureScreenSize: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          ScreenUtil.init(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ARHAMAD Investment',

            // themeMode: MyThemes().themeMode,
            //  theme: ThemeData() == ThemeData.dark()
            //      ? MyThemes().darkTheme
            //      : MyThemes().lightTheme,

            // theme: ThemeData(
            //   appBarTheme: AppBarTheme(
            //     centerTitle: true,
            //     iconTheme: IconThemeData(color: Colors.white, size: 24.sp),
            //     titleTextStyle: TextStyle(
            //       fontSize: MyTextSizes().textSize1,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.white,
            //     ),
            //     color: ThemeService().isDarkMode
            //         ? Colors.green.shade900
            //         : Colors.green,
            //   ),
            //   scaffoldBackgroundColor: ThemeService().isDarkMode
            //       ? Colors.green.shade50
            //       : Colors.white,
            //   colorScheme: ThemeService().isDarkMode
            //       ? ColorScheme.fromSeed(seedColor: Colors.black)
            //       : ColorScheme.fromSeed(seedColor: Colors.green),
            //   useMaterial3: true,
            // ),
            initialRoute: '/',

            routes: routes,
          );
        },
      ),
    );
  }
}
