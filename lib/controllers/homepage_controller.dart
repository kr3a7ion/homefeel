import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/asset_path.dart';

class IconSwitcher extends GetxController {
  RxBool notificationBellActive = false.obs;
  RxBool bookmarkActive = false.obs;

  void toggleNotificationBell() {
    notificationBellActive.value = !notificationBellActive.value;
  }

  void toogleBookmarkActive() {
    bookmarkActive.value = !bookmarkActive.value;
  }
}

class SearchBarConroller extends GetxController {
  TextEditingController searchBarConroller = TextEditingController();

  RxBool searchBarActive = false.obs;

  @override
  void onClose() {
    searchBarConroller.dispose();
    super.onClose();
  }

  void toogleSearchBarColor() {
    searchBarActive.value = !searchBarActive.value;
  }
}

class PopularityFilter extends GetxController {
  final List<String> populariyClassing = [
    'Recommended',
    'Popular',
    'Trending',
    'Most Viewed',
    'Highly Rated',
    'New',
  ];

  int isFilterActiveIndex = -0.obs;

  void activeFilter(int theIndex) {
    isFilterActiveIndex = theIndex;
    update();
  }
}

class RecommendationCardController extends GetxController {
  final List<String> recommendedApartments = [
    'Emeralda De Hotel',
    'Royal President Hotel',
    'Palms Casino',
    'Palazo Hotel',
    'Bugari Resort',
    'Bristol Resort',
  ];

  final List<String> recommendedApartmentslocation = [
    'Emeralda',
    'Royal',
    'Palms',
    'Palazo',
    'Bugari',
    'Bristol',
  ];

  final List recommendedApartmentsImage = [
    apartmentImageOne,
    apartmentImageTwo,
    apartmentImageThree,
    apartmentImageFour,
    apartmentImageFive,
    apartmentImageSix,
  ];

  int isCardActiveIndex = -0.obs;

  void activeFilter(int theIndex) {
    isCardActiveIndex = theIndex;
    update();
  }
}
