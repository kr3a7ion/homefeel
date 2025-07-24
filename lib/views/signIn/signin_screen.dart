import 'package:bmg/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_colors.dart';
import '../../common/widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.whitebackground,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 100),
            largeText50("Let's log you In"),
            Column(
              children: [
                customOutlinedButton(onttaped: () {}),
                const SizedBox(
                  height: 20,
                ),
                customOutlinedButton(
                    onttaped: () {},
                    useImageIcon: true,
                    theText: 'Continue with Google'),
                const SizedBox(
                  height: 20,
                ),
                customOutlinedButton(
                  onttaped: () {},
                  theText: 'Continue with Apple',
                  iconColor: Colors.black,
                  theIcon: Icons.apple,
                ),
                const SizedBox(height: 40),
                customDivider('or'),
                const SizedBox(height: 40),
                largePrimaryButton(
                  'Sign in with password',
                  () {
                    Get.offAndToNamed(AppRoutes.signInPassID);
                  },
                  thebuttonHeight: 65,
                ),
              ],
            ),
            clickableRowText(
              () => Get.offAndToNamed(AppRoutes.signUpID),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}
