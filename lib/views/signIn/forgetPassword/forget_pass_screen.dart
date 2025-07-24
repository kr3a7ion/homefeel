import 'package:bmg/common/app_colors.dart';
import 'package:bmg/common/asset_path.dart';
import 'package:bmg/common/widget.dart';
import 'package:bmg/controllers/page_controller.dart';
import 'package:bmg/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../common/appcolors.dart';

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
                        ? AppColors.divider
                        : AppColors.accentTeal,
                    theIconPath: IconlyBold.chat,
                  ),
                ),
                const SizedBox(height: 15),
                Obx(
                  () => customTile(() {
                    activetileController.toogleActiveTile();
                  },
                      theBorderColor: activetileController.isActive.value
                          ? AppColors.accentTeal
                          : AppColors.divider,
                      theTypeText: 'Email',
                      theReceiverText: 'kr**h@domain.com',
                      theIconPath: IconlyBold.message),
                ),
              ],
            ),
            const SizedBox(height: 50),
            largePrimaryButton(thebuttonHeight: 65, 'Continue', () {
              Get.toNamed(AppRoutes.passResetID);
            }),
            const SizedBox(height: 30),
          ],
        ),
      )),
    );
  }
}
