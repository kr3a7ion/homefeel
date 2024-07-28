import 'package:get/get.dart';

class ActiveIcon extends GetxController {
  RxBool isIconActive = false.obs;

  void switchActiveIconState() {
    isIconActive.value = !isIconActive.value;
  }
}

class BookingFilter extends GetxController {
  final List<String> bookingFilter = [
    'Ongoing',
    'Completed',
    'Canceled',
  ];

  int isFilterActiveIndex = -0.obs;

  void activeFilter(int theIndex) {
    isFilterActiveIndex = theIndex;
    update();
  }
}

class TileButtonController extends GetxController {
  RxBool isCancelButtonActive = true.obs;
  RxBool isTicketButtonActive = false.obs;
  RxInt theActiveIndex = 0.obs;

  void toogleCancelButton() {
    isCancelButtonActive.value = !isCancelButtonActive.value;
    if (isCancelButtonActive.value) {
      isTicketButtonActive.value = false;
    }
  }

  void toogleTicketButton() {
    isTicketButtonActive.value = !isTicketButtonActive.value;
    if (isTicketButtonActive.value) {
      isCancelButtonActive.value = false;
    }
  }
}
