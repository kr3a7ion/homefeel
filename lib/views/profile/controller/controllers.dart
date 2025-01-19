import 'package:get/get.dart';

class ProfileMenuActiveIcon extends GetxController {
  RxBool isIconActive = false.obs;

  void switchActiveIconState() {
    isIconActive.value = !isIconActive.value;
  }
}
