import 'package:bmg/common/asset_path.dart';
import 'package:bmg/common/widget.dart';
import 'package:bmg/views/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
              height: 10,
            ),
            smallText16(
              descriptionText,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 40),
              child: nextButton(theIndex, context, theController),
            ),
          ],
        ),
      ),
    ],
  );
}
