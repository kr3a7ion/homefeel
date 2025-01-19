import 'package:flutter/material.dart';
import 'package:get/get.dart';

// this controller can be used for any textfield and main Email Textfield
// class TextFieldController extends GetxController {
//   final TextEditingController emailController = TextEditingController();
//   RxBool isActive = false.obs;

//   @override
//   void onClose() {
//     emailController.dispose();
//     super.onClose();
//   }

//   void toogleColor() {
//     isActive.value = !isActive.value;
//   }
// }

// class PasswordTextFieldController extends GetxController {
//   RxBool isActive = false.obs;
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   void onClose() {
//     passwordController.dispose();
//     super.onClose();
//   }

//   void toogleColor() {
//     isActive.value = !isActive.value;
//   }
// }

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
  RxString dropDownGenderValue = 'one'.obs;

  // @override
  // void onClose() {
  //   fullname.dispose();
  //   username.dispose();
  //   userGender.dispose();
  //   super.onClose();
  // }

  void toogleColorFullname() {
    isFullnameActive.value = !isFullnameActive.value;
  }

  void toogleColorUsername() {
    isUsernameActive.value = !isUsernameActive.value;
  }

  void toogleColorUserGender() {
    isUserGenderActive.value = !isUserGenderActive.value;
  }

  void toogleColorDateOfBirth() {
    isUserDateOfBirthActive.value = !isUserDateOfBirthActive.value;
  }

  void toogleColorUserEmail() {
    isUserEmailActive.value = !isUserEmailActive.value;
  }
}
