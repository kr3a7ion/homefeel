import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OnboardingPageIndexCounter extends GetxController {
  final PageController myPageController = PageController();
  var theIndex = 0;

  void changeIndex(int index) {
    theIndex = index;
  }
}
