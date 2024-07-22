import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  TextEditingController searchBarConroller = TextEditingController();

  RxBool searchBarActive = true.obs;

  @override
  void onClose() {
    searchBarConroller.dispose();
    super.onClose();
  }

  void toogleSearchBarColor() {
    searchBarActive.value = !searchBarActive.value;
  }
}

class FilterTileorGridController extends GetxController {
  final filterDisplayTypeActive = 'tile'.obs;

  void toogleActiveDisplay(String theValue) {
    filterDisplayTypeActive.value = theValue;
  }
}
