import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/asset_path.dart';
import 'package:homefeel/common/widget.dart';
import 'package:homefeel/controllers/page_controller.dart';
import 'package:homefeel/views/signup/widgets.dart';

class CreatePasswordScreen extends StatelessWidget {
  CreatePasswordScreen({super.key});
  final TextEditingController _passwordController = TextEditingController();
  final PasswordTextFieldColorController _passwordColorController =
      Get.put(PasswordTextFieldColorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Appcolors.whitebackground,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            backButton(theText: 'Create New Password'),
            Expanded(
              child: Image.asset(
                createNewPasswordImage,
                height: 300,
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    smallText18('Create Your New Password'),
                  ],
                ),
                const SizedBox(height: 20),
                customPasswordTextField(
                    _passwordController, _passwordColorController),
                const SizedBox(height: 20),
                customPasswordTextField(
                    _passwordController, _passwordColorController),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [customCheckBox(), smallText18('Remember me')],
                ),
                const SizedBox(height: 50),
              ],
            ),
            largePurpleButton('Continue', () {
              showAdaptiveDialog(
                  context: (context),
                  builder: (BuildContext context) {
                    return Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Container(
                        height: 450,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 250),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Appcolors.lightPurpleButton,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(
                                thumbsUp,
                                height: 100,
                              ),
                            ),
                            largeText32('Congratulations!',
                                theColor: Appcolors.purpleText),
                            const SizedBox(height: 10),
                            smallText18('Your account is ready'),
                            const SizedBox(height: 15),
                            largePurpleButton('Go to Homepage', () {}),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    );
                  });
            })
          ],
        ),
      )),
    );
  }
}
