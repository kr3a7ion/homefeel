import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Email field controller
class TextFieldController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  RxBool isActive = false.obs;

  void toogleEmailfieldColor() {
    isActive.value = !isActive.value;
  }
}

// Password field controller
class SignUpPasswordTextFieldController extends GetxController {
  RxBool isActive = false.obs;
  final TextEditingController passwordController = TextEditingController();

  void tooglePassFieldColor() {
    isActive.value = !isActive.value;
  }
}
