import 'package:bmg/common/app_colors.dart';
import 'package:bmg/common/contantsvar.dart';
import 'package:bmg/common/widget.dart';
import 'package:bmg/views/home/widgets.dart';
import 'package:bmg/views/profile/controller/controllers.dart';
import 'package:bmg/views/profile/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../common/appcolors.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileMenuActiveIcon _menuActiveIcon =
      Get.put(ProfileMenuActiveIcon());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.whiteText,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Image.asset(
                    //   purpleLogo,
                    //   height: 40,
                    // ),
                    // const SizedBox(width: 8),
                    smallText16('Profile',
                        theColor: AppColors.accentTeal,
                        theSize: 24,
                        theFontWeight: FontWeight.bold),
                  ],
                ),
                Obx(
                  () => Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      customIconButton30(
                        theIcon: IconlyBroken.more_circle,
                        onpressed: () {
                          _menuActiveIcon.switchActiveIconState();
                        },
                        theIconColor: _menuActiveIcon.isIconActive.value
                            ? AppColors.iconSecondary
                            : Appcolors.greyIcon,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            customCircleAvatar(
              () {},
            ),
            const SizedBox(height: 15),
            largeText28(userName),
            smallText16(userEmail),
            const SizedBox(height: 10),
            const Divider(
              color: Appcolors.greyBorder,
            ),
            customProfileTile(
              ontapped: () {},
              theIcon: IconlyBroken.profile,
              theText: 'Edit Profile',
            ),
            customProfileTile(
              ontapped: () {},
              theIcon: IconlyBroken.wallet,
              theText: 'Payment',
            ),
            customProfileTile(
              ontapped: () {},
              theIcon: IconlyBroken.notification,
              theText: 'Notification',
            ),
            customProfileTile(
              ontapped: () {},
              theIcon: IconlyBroken.shield_done,
              theText: 'Security',
            ),
            customProfileTile(
              ontapped: () {},
              theIcon: IconlyBroken.info_circle,
              theText: 'Help',
            ),
            // darkModetile(
            //   theIcon: IconlyLight.show,
            //   theText: 'Dark Theme',
            // ),
            customProfileTile(
              ontapped: () {},
              theIcon: IconlyBroken.logout,
              theText: 'Logout',
              theIconColor: Colors.red,
              theTextColor: Colors.red,
            ),
          ],
        ),
      )),
    );
  }
}
