import 'package:bmg/common/app_colors.dart';
import 'package:bmg/views/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../common/appcolors.dart';
import '../../../common/widget.dart';
import '../widgets.dart';

class NotificationPrompt extends StatelessWidget {
  const NotificationPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    backButton(theText: 'Notification'),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    customIconButton30(
                      theIcon: IconlyBroken.more_circle,
                      onpressed: () {},
                      theIconColor: Appcolors.greyText,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                smallText16('Today',
                    theSize: 20, theFontWeight: FontWeight.bold),
                notificationCards(
                    theIcon: Icons.check_box_rounded,
                    theIconColor: AppColors.primaryBeige,
                    theIconBackgroundColor: AppColors.secondaryGreen,
                    theCardStatus: 'Payment Successful',
                    theCardDescription: 'Laluna Booking was Successful'),
                notificationCards(
                    theIcon: IconlyBold.wallet,
                    theIconColor: AppColors.backgroundLight,
                    theIconBackgroundColor: AppColors.primaryBlue,
                    theCardStatus: 'Wallet Connected',
                    theCardDescription: 'Card wallet connected Successful'),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                smallText16('Yesterday',
                    theSize: 20, theFontWeight: FontWeight.bold),
                notificationCards(
                    theIcon: Icons.close_rounded,
                    theIconColor: AppColors.primaryBeige,
                    theIconBackgroundColor: AppColors.accentRed,
                    theCardStatus: 'Booking Cancelled',
                    theCardDescription: 'Laluna Booking was Cancelled'),
                notificationCards(
                    theIcon: IconlyBold.lock,
                    theIconColor: AppColors.backgroundLight,
                    theIconBackgroundColor: AppColors.accentTeal,
                    theCardStatus: 'Verification Successful',
                    theCardDescription: 'Account verification Successful'),
              ],
            )
          ],
        ),
      )),
    );
  }
}
