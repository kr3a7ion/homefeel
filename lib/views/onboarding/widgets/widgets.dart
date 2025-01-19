import 'package:bmg/common/appcolors.dart';
import 'package:bmg/common/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget nextButton(
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
      largePrimaryButton(
          thebuttonHeight: 65, thePageIndex < 3 ? 'Next' : 'Continue', () {
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
              child: largePrimaryButton(
                  thebuttonHeight: 65,
                  'Skip',
                  theButtonColor: AppColors.secondaryGreen,
                  theTextColor: AppColors.buttonText, () {
                Get.offAndToNamed('signInScreen');
              }),
            )
          : const SizedBox(),
    ],
  );
}
