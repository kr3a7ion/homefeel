import 'package:bmg/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMG',
      navigatorKey: _navKey,
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Appcolors.whitebackground,
          navigationDrawerTheme: const NavigationDrawerThemeData(
              backgroundColor: Appcolors.whitebackground)),
      themeMode: ThemeMode.light,
      
      initialRoute: '/',
      getPages: AppPages.pages,
    );
  }
}
