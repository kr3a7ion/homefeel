import 'package:bmg/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_colors.dart';
import '../../common/asset_path.dart';
import '../../common/widget.dart';
import '../signup/widgets.dart';
import 'controllers/controller.dart';

class LoginPasswordScreen extends StatelessWidget {
  LoginPasswordScreen({super.key});

  final EmailTextFieldController _singinEmailController =
      Get.put(EmailTextFieldController());
  final SigninPasswordTextFieldController _signInpasswordColorController =
      Get.put(SigninPasswordTextFieldController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Appcolors.whitebackground,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 130),
            largeText50("Login to your Account"),
            const SizedBox(height: 40),
            Column(
              children: [
                customTextField(_singinEmailController.emailController,
                    _singinEmailController.isActive, () {
                  _singinEmailController.toogleColor();
                }),
                const SizedBox(height: 20),
                customPasswordTextField(
                    _signInpasswordColorController.passwordController,
                    _signInpasswordColorController.isActive, () {
                  _signInpasswordColorController.toogleColor();
                })
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [customCheckBox(), smallText16('Remember me')],
            ),
            const SizedBox(height: 10),
            largePrimaryButton(thebuttonHeight: 65, 'Sign in', () {
              Get.offAndToNamed(AppRoutes.navPageID);
            }),
            const SizedBox(height: 10),
            clickableRowText(() {
              Get.toNamed(AppRoutes.forgetPassID);
            }, thefirstText: '', theSecondText: 'Forgot Password?'),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customDivider('or continue with'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        outlinedButtonIcons(),
                        outlinedButtonIcons(
                            iconColor: Appcolors.blackIcon,
                            theIcon: Icons.apple),
                        outlinedButtonIcons(
                          useImageIcon: true,
                          iconImagePath: googleIcon,
                        ),
                      ],
                    ),
                  ),
                  clickableRowText(
                    () {
                      Get.offAllNamed(AppRoutes.signUpID);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
