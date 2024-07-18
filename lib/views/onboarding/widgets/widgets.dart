import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/widget.dart';

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
