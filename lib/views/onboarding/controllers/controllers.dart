import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PageIndexCounter extends GetxController {
  var theIndex = 0;

  void changeIndex(int index) {
    theIndex = index;
  }
}
