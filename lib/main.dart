import 'package:bmg/views/home/bottom_navigation.dart';
import 'package:bmg/views/home/home_screen.dart';
import 'package:bmg/views/home/widgets/booked_prompt.dart';
import 'package:bmg/views/home/widgets/notification_prompt.dart';
import 'package:bmg/views/onboarding/onboarding_screen.dart';
import 'package:bmg/views/onboarding/splash_screen.dart';
import 'package:bmg/views/signIn/forgetPassword/create_pass_screen.dart';
import 'package:bmg/views/signIn/forgetPassword/forget_pass_screen.dart';
import 'package:bmg/views/signIn/forgetPassword/pass_reset_screen.dart';
import 'package:bmg/views/signIn/signin_screen.dart';
import 'package:bmg/views/signIn/singin_pass_screen.dart';
import 'package:bmg/views/signup/fill_profile_screen.dart';
import 'package:bmg/views/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/app_colors.dart';
import 'common/asset_path.dart';

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
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: onboardingScreenId, page: () => OnboardingScreen()),
        GetPage(name: signInID, page: () => const SignInScreen()),
        GetPage(name: signInPassID, page: () => LoginPasswordScreen()),
        GetPage(name: signUpID, page: () => SignupScreen()),
        GetPage(name: forgetPassID, page: () => ForgetPassScreen()),
        GetPage(name: passResetID, page: () => PassResetScreen()),
        GetPage(name: createPassScreenID, page: () => CreatePasswordScreen()),
        GetPage(name: fillProfileScreenID, page: () => FillProfileScreen()),
        GetPage(name: homeScreenID, page: () => HomeScreen()),
        GetPage(name: navPageID, page: () => BottomNavigationTab()),
        GetPage(name: bookmarkPromptPageID, page: () => BookedPrompt()),
        GetPage(
            name: notificationPromptPageId,
            page: () => const NotificationPrompt()),
      ],
    );
  }
}
