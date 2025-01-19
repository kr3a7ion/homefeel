import 'package:bmg/views/home/controllers/recommend_card_controller.dart';
import 'package:get/get.dart';

class BookedPromptController extends GetxController {
  RxList<bool> isBookedButtonActiveList = <bool>[].obs;
  RxList<Map<String, dynamic>> bookedApartments = <Map<String, dynamic>>[].obs;

  final RecommendationCardController listCardController =
      Get.put(RecommendationCardController());

  @override
  void onInit() {
    super.onInit();
    initializeList(listCardController.recommendedApartments.length);
  }

  void initializeList(int length) {
    // Initialize the list with `false` values for each button
    isBookedButtonActiveList.value = List.generate(length, (index) => false);
  }

  void toggleBookedIcon(int index) {
    // Toggle the state of the specific button
    isBookedButtonActiveList[index] = !isBookedButtonActiveList[index];
    update();
  }

  // Adding and removing apartment from list
  void addBookedApartment(Map<String, dynamic> apartment) {
    bookedApartments.add(apartment);

  }

  void removeBookedApartment(Map<String, dynamic> apartment) {
    bookedApartments.remove(apartment);
  }
}
