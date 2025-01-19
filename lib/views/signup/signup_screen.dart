import 'package:bmg/common/app_colors.dart';
import 'package:bmg/common/asset_path.dart';
import 'package:bmg/common/widget.dart';
import 'package:bmg/views/signup/controllers/controller.dart';
import 'package:bmg/views/signup/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextFieldController _colorController = Get.put(TextFieldController());
  final SignUpPasswordTextFieldController _passwordColorController =
      Get.put(SignUpPasswordTextFieldController());

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
            largeText50("Create your Account"),
            const SizedBox(height: 40),
            Column(
              children: [
                customTextField(
                    _colorController.emailController, _colorController.isActive,
                    () {
                  _colorController.toogleEmailfieldColor();
                }),
                const SizedBox(height: 20),
                customPasswordTextField(
                    _passwordColorController.passwordController,
                    _passwordColorController.isActive,
                    () => _passwordColorController.tooglePassFieldColor())
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [customCheckBox(), smallText16('Remember me')],
            ),
            const SizedBox(height: 10),
            largePrimaryButton('Sign up', () {
              Get.offAllNamed(fillProfileScreenID);
            }),
            const SizedBox(height: 50),
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
                  clickableRowText(() {
                    Get.offAllNamed(signInPassID);
                  },
                      thefirstText: 'Already have an account?',
                      theSecondText: 'Sign in'),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
