import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/asset_path.dart';
import 'package:homefeel/common/widget.dart';

class FillProfileScreen extends StatelessWidget {
  const FillProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.whitebackground,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            backButton(theText: 'Fill Your Profile'),
            const SizedBox(height: 30),
            customCircleAvatar(() {}),
            const SizedBox(height: 20),
            Column(
              children: [],
            ),
            largePurpleButton('Continue', () {}),
          ],
        ),
      )),
    );
  }

  Widget customCircleAvatar(Function() ontapped) {
    return GestureDetector(
      onTap: ontapped,
      child: const CircleAvatar(
        radius: 90,
        backgroundColor: Appcolors.whitebackground,
        backgroundImage: AssetImage(splachBackgroundImage),
        child: Icon(
          Icons.edit_square,
          size: 40,
          color: Appcolors.shadepurpleButton,
        ),
      ),
    );
  }
}
