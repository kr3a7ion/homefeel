import 'package:bmg/common/app_colors.dart';
import 'package:bmg/common/asset_path.dart';
import 'package:bmg/views/onboarding/controllers/controllers.dart';
import 'package:bmg/views/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../common/appcolors.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageIndexCounter _thePageController = Get.put(PageIndexCounter());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.whitebackground,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              _thePageController.changeIndex(value);
            },
            controller: _thePageController.myPageController,
            children: [
              // onboarding screen one
              onboardingPage(
                context,
                _thePageController.myPageController,
                theIndex: 1,
                imagePath: onboardingPageoneImage,
                theHeaderText: 'Travel comfortably and safely.',
                descriptionText:
                    "This space hold the page description, but for now it's empty",
              ),

              // onboarding screen two
              onboardingPage(
                context,
                _thePageController.myPageController,
                theIndex: 2,
                imagePath: onboardingPagetwoImage,
                theHeaderText: 'Travel comfortably and safely.',
                descriptionText:
                    "This space hold the page description, but for now it's empty",
              ),

              // onboarding screen three
              onboardingPage(
                context,
                _thePageController.myPageController,
                theIndex: 3,
                imagePath: onboardingPagethreeImage,
                theHeaderText: 'Travel comfortably and safely.',
                descriptionText:
                    "This space hold the page description, but for now it's empty",
              ),
            ],
          ),
          Positioned(
              bottom: 60,
              left: 150,
              right: 150,
              child: SmoothPageIndicator(
                controller: _thePageController.myPageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                  dotHeight: 6,
                  dotColor: AppColors.secondaryGreen,
                  activeDotColor: AppColors.iconSecondary,
                ),
              ))
        ],
      ),
    );
  }
}
