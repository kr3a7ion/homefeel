import 'package:flutter/material.dart';
import 'package:homefeel/common/asset_path.dart';
import 'package:homefeel/common/widget.dart';
import 'package:homefeel/views/onboarding/widgets/widgets.dart';

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
              child: nextButton(theIndex, context, theController),
            ),
          ],
        ),
      ),
    ],
  );
}

