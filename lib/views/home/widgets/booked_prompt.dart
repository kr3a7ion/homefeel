import 'package:bmg/common/app_colors.dart';
import 'package:bmg/common/appcolors.dart';
import 'package:bmg/views/home/controllers/recommend_card_controller.dart';
import 'package:bmg/views/home/controllers/toogleview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../common/widget.dart';
import '../controllers/booked_prompt_controller.dart';
import '../widgets.dart';

class BookedPrompt extends StatelessWidget {
  BookedPrompt({super.key});

  final ViewToogleController _viewToogleController =
      Get.put(ViewToogleController());
  final RecommendationCardController _listCardController =
      Get.put(RecommendationCardController());
  final BookedPromptController _bookedPromptController =
      Get.put(BookedPromptController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Appcolors.whitebackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(
            () => Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      backButton(theText: 'Recently Booked'),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      customIconButton30(
                        theIcon: _viewToogleController.isGridView.value
                            ? IconlyBroken.paper
                            : IconlyBroken.category,
                        onpressed: () {
                          _viewToogleController.toogleView();
                        },
                        theIconColor: Appcolors.greyText,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _viewToogleController.isGridView.value
                  ? GetBuilder(
                      init: _listCardController,
                      builder: (context) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns in the grid
                            childAspectRatio: 3 / 5,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 5,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount:
                              _bookedPromptController.bookedApartments.length,
                          itemBuilder: (BuildContext context, index) {
                            final apartmentInfo =
                                _bookedPromptController.bookedApartments[index];
                            return Obx(
                              () => customGridTile(
                                bookedCardOnpressed: () {
                                  _bookedPromptController
                                      .toggleBookedIcon(index);
                                },
                                theBookedIcon: _bookedPromptController
                                        .isBookedButtonActiveList[index]
                                    ? IconlyBold.bookmark
                                    : IconlyBroken.bookmark,
                                theBookedIconColor: _bookedPromptController
                                        .isBookedButtonActiveList[index]
                                    ? AppColors.secondaryGreen
                                    : AppColors.iconSecondary,
                                index: index,
                                recommendedApartmentsImage:
                                    apartmentInfo['image'],
                                recommendedApartments: apartmentInfo['name'],
                                recommendedApartmentslocation:
                                    apartmentInfo['location'],
                                apartmentCost: apartmentInfo['cost'],
                              ),
                            );
                          },
                        );
                      })
                  : GetBuilder(
                      init: _listCardController,
                      builder: (context) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount:
                                _bookedPromptController.bookedApartments.length,
                            itemBuilder: (BuildContext context, index) {
                              final apartmentInfo = _bookedPromptController
                                  .bookedApartments[index];
                              return Obx(
                                () => customListTile(
                                  bookedCardOnpressed: () {
                                    _bookedPromptController
                                        .toggleBookedIcon(index);
                                  },
                                  theBookedIcon: _bookedPromptController
                                          .isBookedButtonActiveList[index]
                                      ? IconlyBold.bookmark
                                      : IconlyBroken.bookmark,
                                  theBookedIconColor: _bookedPromptController
                                          .isBookedButtonActiveList[index]
                                      ? AppColors.secondaryGreen
                                      : AppColors.iconSecondary,
                                  index: index,
                                  recommendedApartmentsImage:
                                      apartmentInfo['image'],
                                  recommendedApartments: apartmentInfo['name'],
                                  recommendedApartmentslocation:
                                      apartmentInfo['location'],
                                  apartmentCost: apartmentInfo['cost'],
                                ),
                              );
                            });
                      }),
            ]),
          ),
        ),
      ),
    );
  }
}
