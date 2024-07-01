import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/asset_path.dart';
import 'package:homefeel/common/widget.dart';
import 'package:homefeel/controllers/page_controller.dart';
import 'package:homefeel/views/signIn/singin_pass_screen.dart';
import 'package:homefeel/views/signup/widgets.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextFieldColorController _colorController =
      Get.put(TextFieldColorController());
  final PasswordTextFieldColorController _passwordColorController =
      Get.put(PasswordTextFieldColorController());

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
            largeText60("Create your Account"),
            const SizedBox(height: 40),
            Column(
              children: [
                customTextField(_emailController, _colorController),
                const SizedBox(height: 20),
                customPasswordTextField(
                    _passwordController, _passwordColorController)
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [customCheckBox(), smallText18('Remember me')],
            ),
            const SizedBox(height: 10),
            largePurpleButton('Sign up', () {
              Get.toNamed(fillProfileScreenID);
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
                    Get.to(() => LoginPasswordScreen());
                  },
                      thefirstText: 'Already have an account?',
                      theSecondText: 'Sign in')
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
