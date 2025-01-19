import 'package:bmg/common/asset_path.dart';
import 'package:get/get.dart';

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

  RxInt apartmentCost = 29.obs;
  int isCardActiveIndex = -0.obs;

  void activeFilter(int theIndex) {
    isCardActiveIndex = theIndex;
    update();
  }
}
