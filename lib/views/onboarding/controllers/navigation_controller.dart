import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../onboarding_screen.dart';

class NavigationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToOnboardingAfterDelay();
  }

  Future<void> navigateToOnboardingAfterDelay({
    Duration delay = const Duration(seconds: 5),
  }) async {
    try {
      await Future.delayed(delay);

      await Get.offAll(() => OnboardingScreen());
    } catch (e) {
      // Handle any potential errors here.
      debugPrint('Error during navigation: $e');
    }
  }
}
