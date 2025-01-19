import 'package:get/get.dart';

class IconColorSwitcher extends GetxController {
  RxBool notificationBellActive = false.obs;
  RxBool bookmarkActive = false.obs;

  void toggleNotificationBell() {
    notificationBellActive.value = !notificationBellActive.value;
  }

  void toogleBookmarkActive() {
    bookmarkActive.value = !bookmarkActive.value;
  }
}
