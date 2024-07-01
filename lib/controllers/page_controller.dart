import 'package:get/get.dart';

class PageIndexCounter extends GetxController {
  var theIndex = 0;

  void changeIndex(int index) {
    theIndex = index;
  }
}

class TextFieldColorController extends GetxController {
  RxBool isActive = false.obs;

  void toogleColor() {
    isActive.value = !isActive.value;
  }
}

class PasswordTextFieldColorController extends GetxController {
  RxBool isActive = false.obs;

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
