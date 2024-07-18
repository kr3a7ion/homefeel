import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/asset_path.dart';
import 'package:homefeel/views/onboarding/controllers/controllers.dart';
import 'package:homefeel/views/onboarding/onboarding_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController _myPageController = PageController();
  final PageIndexCounter theController = Get.put(PageIndexCounter());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.offWhiteBackground,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              theController.changeIndex(value);
            },
            controller: _myPageController,
            children: [
              // onboarding screen one
              onboardingPage(
                context,
                _myPageController,
                theIndex: 1,
                imagePath: onboardingPageoneImage,
                theHeaderText: 'Travel comfortably and safely.',
                descriptionText:
                    "This space hold the page discription, but for now it's empty",
              ),

              // onboarding screen two
              onboardingPage(
                context,
                _myPageController,
                theIndex: 2,
                imagePath: onboardingPagetwoImage,
                theHeaderText: 'Travel comfortably and safely.',
                descriptionText:
                    "This space hold the page discription, but for now it's empty",
              ),

              // onboarding screen three
              onboardingPage(
                context,
                _myPageController,
                theIndex: 3,
                imagePath: onboardingPagethreeImage,
                theHeaderText: 'Travel comfortably and safely.',
                descriptionText:
                    "This space hold the page discription, but for now it's empty",
              ),
            ],
          ),
          Positioned(
              bottom: 200,
              left: 160,
              child: SmoothPageIndicator(
                controller: _myPageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                  dotHeight: 10,
                  dotColor: Appcolors.shadepurpleButton,
                  activeDotColor: Appcolors.purpleButton,
                ),
              ))
        ],
      ),
    );
  }
}
