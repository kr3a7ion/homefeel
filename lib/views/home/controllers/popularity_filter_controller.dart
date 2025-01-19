import 'package:get/get.dart';

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
