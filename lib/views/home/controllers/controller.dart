import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationSwitcher extends GetxController {
  RxInt currentIndex = 0.obs;
  late PageController pageViewController;

  @override
  void onInit() {
    pageViewController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    pageViewController.dispose();
    super.onClose();
  }

  void switchTabs(int theIndex) {
    currentIndex.value = theIndex;
    pageViewController.animateToPage(theIndex,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}
