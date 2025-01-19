import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SearchBarController extends GetxController {
  TextEditingController searchBarController = TextEditingController();

  RxBool searchBarActive = false.obs;

  @override
  void onClose() {
    searchBarController.dispose();
    super.onClose();
  }

  void toogleSearchBarColor() {
    searchBarActive.value = !searchBarActive.value;
  }
}
