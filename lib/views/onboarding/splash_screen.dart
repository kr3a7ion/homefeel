import 'package:bmg/common/asset_path.dart';
import 'package:bmg/views/onboarding/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/appcolors.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final NavigationController navigationController =
      Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bmgsp.png')),
          color: AppColors.backgroundLight,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 30,
                color: AppColors.textDark,
                fontWeight: FontWeight.bold,
                fontFamily: theFontFamily,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Effortless Booking, Memorable Moments Be My Guest.',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.smallText,
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
