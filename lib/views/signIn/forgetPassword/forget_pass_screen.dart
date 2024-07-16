import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/asset_path.dart';
import 'package:homefeel/common/widget.dart';
import 'package:homefeel/controllers/page_controller.dart';

class ForgetPassScreen extends StatelessWidget {
  ForgetPassScreen({super.key});

  final ForgetTileController activetileController =
      Get.put(ForgetTileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Appcolors.whitebackground,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            backButton(theText: 'Forgot Password'),
            Expanded(
              child: Image.asset(
                forgetPasswordImage,
                height: 350,
              ),
            ),
            smallText16('Select reset password method, so we can get started.'),
            const SizedBox(height: 10),
            Column(
              children: [
                Obx(
                  () => customTile(
                    () {
                      activetileController.toogleActiveTile();
                    },
                    theBorderColor: activetileController.isActive.value
                        ? Appcolors.greyBorder
                        : Appcolors.purpleButton,
                  ),
                ),
                const SizedBox(height: 15),
                Obx(
                  () => customTile(() {
                    activetileController.toogleActiveTile();
                  },
                      theBorderColor: activetileController.isActive.value
                          ? Appcolors.purpleButton
                          : Appcolors.greyBorder,
                      theTypeText: 'Email',
                      theReceiverText: 'kr**h@domain.com',
                      theImagePath: mailIcon),
                ),
              ],
            ),
            const SizedBox(height: 50),
            largePurpleButton('Continue', () {
              Get.toNamed(passResetID);
            }),
            const SizedBox(height: 30),
          ],
        ),
      )),
    );
  }
}
