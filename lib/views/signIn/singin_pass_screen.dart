import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/asset_path.dart';
import 'package:homefeel/common/widget.dart';
import 'package:homefeel/controllers/page_controller.dart';
import 'package:homefeel/views/signup/widgets.dart';

class LoginPasswordScreen extends StatelessWidget {
  LoginPasswordScreen({super.key});

  final TextFieldController _emailcolorController =
      Get.put(TextFieldController());
  final PasswordTextFieldController _passwordColorController =
      Get.put(PasswordTextFieldController());

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
            backButton(),
            const SizedBox(height: 80),
            largeText60("Login to your Account"),
            const SizedBox(height: 40),
            Column(
              children: [
                customTextField(_emailcolorController.emailController,
                    _emailcolorController.isActive, () {
                  _emailcolorController.toogleColor();
                }),
                const SizedBox(height: 20),
                customPasswordTextField(
                    _passwordColorController.passwordController,
                    _passwordColorController)
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [customCheckBox(), smallText16('Remember me')],
            ),
            const SizedBox(height: 10),
            largePurpleButton('Sign in', () {
              Get.toNamed(homeScreenID);
            }),
            const SizedBox(height: 10),
            clickableRowText(() {
              Get.toNamed(forgetPassID);
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
                      Get.toNamed(signUpID);
                    },
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
