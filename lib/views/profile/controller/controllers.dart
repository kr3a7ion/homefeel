import 'package:get/get.dart';

class ProfileMenuActiveIcon extends GetxController {
  RxBool isIconActive = false.obs;

  void switchActiveIconState() {
    isIconActive.value = !isIconActive.value;
  }
}

class ProfileToogleDarkmode extends GetxController {
  RxBool isDarkMode = false.obs;

  void toogleDarkMode(bool theButtonState) {
    isDarkMode.value = theButtonState;
  }
}
