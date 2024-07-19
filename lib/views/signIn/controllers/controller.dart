import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Email field controlloer
class TextFieldController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  RxBool isActive = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  void toogleColor() {
    isActive.value = !isActive.value;
  }
}

// Password field controller
class SigninPasswordTextFieldController extends GetxController {
  RxBool isActive = false.obs;
  final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    passwordController.dispose();
    super.onClose();
  }

  void toogleColor() {
    isActive.value = !isActive.value;
  }
}
