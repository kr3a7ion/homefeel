import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/asset_path.dart';
import 'package:homefeel/common/widget.dart';
import 'package:homefeel/views/signIn/singin_pass_screen.dart';

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
            largeText60("Let's log you In"),
            Column(
              children: [
                customOutlinedButton(),
                const SizedBox(
                  height: 20,
                ),
                customOutlinedButton(
                    useImageIcon: true, theText: 'Continue with Google'),
                const SizedBox(
                  height: 20,
                ),
                customOutlinedButton(
                  theText: 'Continue with Apple',
                  iconColor: Colors.black,
                  theIcon: Icons.apple,
                ),
                const SizedBox(height: 40),
                customDivider('or'),
                const SizedBox(height: 40),
                largePurpleButton(
                  'Sign in with password',
                  () {
                    Get.to(() => LoginPasswordScreen());
                  },
                  thebuttonHeight: 65,
                ),
              ],
            ),
            clickableRowText(
              () => Get.toNamed(signUpID),
            )
          ],
        ),
      )),
    );
  }
}
