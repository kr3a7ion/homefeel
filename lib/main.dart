import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/asset_path.dart';
import 'package:homefeel/views/home/bottom_navigation.dart';
import 'package:homefeel/views/home/home_screen.dart';
import 'package:homefeel/views/onboarding/onboarding_screen.dart';
import 'package:homefeel/views/onboarding/splash_screen.dart';
import 'package:homefeel/views/signIn/forgetPassword/create_pass_screen.dart';
import 'package:homefeel/views/signIn/forgetPassword/forget_pass_screen.dart';
import 'package:homefeel/views/signIn/forgetPassword/pass_reset_screen.dart';
import 'package:homefeel/views/signIn/signin_screen.dart';
import 'package:homefeel/views/signup/fill_profile_screen.dart';
import 'package:homefeel/views/signup/signup_screen.dart';

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
      title: 'Homefeel',
      navigatorKey: _navKey,
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Appcolors.whitebackground,
          navigationDrawerTheme: const NavigationDrawerThemeData(
              backgroundColor: Appcolors.whitebackground)),
      
      themeMode: ThemeMode.light,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: onboardingScreenId, page: () => OnboardingScreen()),
        GetPage(name: signInID, page: () => const SignInScreen()),
        GetPage(name: signUpID, page: () => SignupScreen()),
        GetPage(name: forgetPassID, page: () => ForgetPassScreen()),
        GetPage(name: passResetID, page: () => PassResetScreen()),
        GetPage(name: createPassScreenID, page: () => CreatePasswordScreen()),
        GetPage(name: fillProfileScreenID, page: () => FillProfileScreen()),
        GetPage(name: homeScreenID, page: () => HomeScreen()),
        GetPage(name: navPageID, page: () => BottomNavigationTab()),
      ],
    );
  }

}
