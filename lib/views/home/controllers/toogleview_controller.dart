import 'package:get/get.dart';

class ViewToogleController extends GetxController {
  RxBool isGridView = false.obs;

  void toogleView() {
    isGridView.value = !isGridView.value;
  }
}
