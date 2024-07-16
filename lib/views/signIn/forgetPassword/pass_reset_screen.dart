import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/asset_path.dart';
import 'package:homefeel/common/widget.dart';
import 'package:pinput/pinput.dart';

class PassResetScreen extends StatelessWidget {
  PassResetScreen({super.key});
  final RxString theCode = '+23********74'.obs;

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            backButton(theText: 'Forgot Password'),
            Column(
              children: [
                smallText16('Code has been sent to $theCode'),
                const SizedBox(height: 50),
                customPinInput(),
                const SizedBox(height: 40),
                clickableRowText(
                  () {},
                  thefirstText: 'Resend code in',
                  theSecondText: '',
                  theSize: 20,
                ),
              ],
            ),
            largePurpleButton('Varify', () {
              Get.toNamed(createPassScreenID);
            })
          ],
        ),
      )),
    );
  }

  SizedBox customPinInput() {
    return SizedBox(
      width: double.infinity,
      child: Pinput(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        length: 4,
        obscureText: false,
        obscuringCharacter: '●',
        focusedPinTheme: PinTheme(
            height: 80,
            width: 80,
            textStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                width: 1,
                color: Appcolors.purpleButton,
              ),
              color: Appcolors.lightPurpleButton,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            )),
        defaultPinTheme: const PinTheme(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Appcolors.lightPurpleButton,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            )),
      ),
    );
  }
}
