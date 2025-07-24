import 'package:bmg/routes/app_routes.dart';
import 'package:bmg/views/onboarding/splash_screen.dart';
import 'package:bmg/views/onboarding/onboarding_screen.dart';
import 'package:bmg/views/signIn/signin_screen.dart';
import 'package:bmg/views/signIn/singin_pass_screen.dart';
import 'package:bmg/views/signup/signup_screen.dart';
import 'package:bmg/views/signup/fill_profile_screen.dart';
import 'package:bmg/views/signIn/forgetPassword/forget_pass_screen.dart';
import 'package:bmg/views/signIn/forgetPassword/pass_reset_screen.dart';
import 'package:bmg/views/signIn/forgetPassword/create_pass_screen.dart';
import 'package:bmg/views/home/home_screen.dart';
import 'package:bmg/views/home/bottom_navigation.dart';
import 'package:bmg/views/home/widgets/booked_prompt.dart';
import 'package:bmg/views/home/widgets/notification_prompt.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: AppRoutes.onboardingScreenId, page: () => OnboardingScreen()),
    GetPage(name: AppRoutes.signInID, page: () => const SignInScreen()),
    GetPage(name: AppRoutes.signInPassID, page: () => LoginPasswordScreen()),
    GetPage(name: AppRoutes.signUpID, page: () => SignupScreen()),
    GetPage(name: AppRoutes.forgetPassID, page: () => ForgetPassScreen()),
    GetPage(name: AppRoutes.passResetID, page: () => PassResetScreen()),
    GetPage(name: AppRoutes.createPassScreenID, page: () => CreatePasswordScreen()),
    GetPage(name: AppRoutes.fillProfileScreenID, page: () => FillProfileScreen()),
    GetPage(name: AppRoutes.homeScreenID, page: () => HomeScreen()),
    GetPage(name: AppRoutes.navPageID, page: () => BottomNavigationTab()),
    GetPage(name: AppRoutes.bookmarkPromptPageID, page: () => BookedPrompt()),
    GetPage(
        name: AppRoutes.notificationPromptPageId, page: () => const NotificationPrompt()),
  ];
}
