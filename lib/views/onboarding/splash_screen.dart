import 'package:flutter/material.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/asset_path.dart';
import 'package:homefeel/views/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void switchTimer() async {
    await Future.delayed(const Duration(seconds: 5), () {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => OnboardingScreen()));
    });
  }

  @override
  void initState() {
    switchTimer();
    super.initState();
  }

  @override
  void dispose() {
    switchTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(splachBackgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to',
              style: TextStyle(
                fontSize: 30,
                color: Appcolors.whiteText,
                fontWeight: FontWeight.bold,
                fontFamily: theFontFamily,
              ),
            ),
            Text(
              'HomeFeel',
              style: TextStyle(
                fontSize: 50,
                color: Appcolors.purpleText,
                fontWeight: FontWeight.w900,
                fontFamily: theFontFamily,
              ),
            ),
            Text(
              'Beyond mere concept, self-care is a fundamental aspect of our commitment to you.',
              style: TextStyle(
                fontSize: 16,
                color: Appcolors.whiteText,
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
