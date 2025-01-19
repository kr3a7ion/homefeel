import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Password field controller
class ForgetPasswordPasswordTextFieldController extends GetxController {
  RxBool isActive = false.obs;
  final TextEditingController passwordController = TextEditingController();

  // @override
  // void onClose() {
  //   passwordController.dispose();
  //   super.onClose();
  // }

  void toogleColor() {
    isActive.value = !isActive.value;
  }
}
