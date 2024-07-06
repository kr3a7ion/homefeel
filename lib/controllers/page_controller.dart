import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageIndexCounter extends GetxController {
  var theIndex = 0;

  void changeIndex(int index) {
    theIndex = index;
  }
}

// this controller can be used for any textfield and main Email Textfield
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

class PasswordTextFieldController extends GetxController {
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

class ObscureTextController extends GetxController {
  RxBool isActive = false.obs;

  void toogleObscure() {
    isActive.value = !isActive.value;
  }
}

class CheckBoxController extends GetxController {
  RxBool isActive = false.obs;

  void toogleCheckBox() {
    isActive.value = !isActive.value;
  }
}

class ForgetTileController extends GetxController {
  RxBool isActive = false.obs;

  void toogleActiveTile() {
    isActive.value = !isActive.value;
  }
}

class RegFormTextEditControllers extends GetxController {
  final TextEditingController fullname = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController userGender = TextEditingController();
  final TextEditingController userDateOfBirth = TextEditingController();
  final TextEditingController userEmail = TextEditingController();

  RxBool isFullnameActive = false.obs;
  RxBool isUsernameActive = false.obs;
  RxBool isUserGenderActive = false.obs;
  RxBool isUserDateOfBirthActive = false.obs;
  RxBool isUserEmailActive = false.obs;

  @override
  void onClose() {
    fullname.dispose();
    username.dispose();
    userGender.dispose();
    super.onClose();
  }

  void toogleColor(RxBool isActive) {
    isFullnameActive.value = !isActive.value;
    isUsernameActive = (!isActive.value) as RxBool;
    isUserGenderActive = (!isActive.value) as RxBool;
    isUserDateOfBirthActive = (!isActive.value) as RxBool;
    isUserEmailActive = (!isActive.value) as RxBool;
  }
}
