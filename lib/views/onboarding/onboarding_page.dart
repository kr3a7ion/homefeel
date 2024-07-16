import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/asset_path.dart';
import 'package:homefeel/common/widget.dart';

Widget onboardingPage(BuildContext context, PageController theController,
    {int theIndex = 0,
    String imagePath = onboardingPageoneImage,
    String descriptionText = 'Descriptive Text here',
    String theHeaderText = 'The Header Text here'}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height - 450,
        width: double.infinity,
      ),
      const SizedBox(
        height: 40,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            largeText28(
              theHeaderText,
            ),
            const SizedBox(
              height: 15,
            ),
            smallText16(
              descriptionText,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 40),
              child: _nextButton(theIndex, context, theController),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _nextButton(
  int thePageIndex,
  BuildContext context,
  PageController thePageController,
) {
  return Column(
    children: [
      thePageIndex < 3
          ? const SizedBox(
              height: 0,
            )
          : const SizedBox(
              height: 30,
            ),
      //
      largePurpleButton(thePageIndex < 3 ? 'Next' : 'Continue', () {
        if (thePageIndex < 3) {
          thePageController.animateToPage(
            thePageIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceInOut,
          );
        } else {
          Get.offAndToNamed('signInScreen');
        }
      }),

      thePageIndex < 3
          ? Padding(
              padding: const EdgeInsets.only(top: 15),
              child: largePurpleButton('Skip',
                  theButtonColor: Appcolors.shadepurpleButton,
                  theTextColor: Appcolors.purpleText, () {
                //Navigator.pop(context);
                Get.offAndToNamed('signInScreen');
              }),
            )
          : const SizedBox(),
    ],
  );
}
