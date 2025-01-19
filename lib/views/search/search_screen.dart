import 'package:bmg/common/app_colors.dart';
import 'package:bmg/common/appcolors.dart';
import 'package:bmg/common/widget.dart';
import 'package:bmg/views/home/controllers/booked_prompt_controller.dart';
import 'package:bmg/views/home/controllers/popularity_filter_controller.dart';
import 'package:bmg/views/home/controllers/recommend_card_controller.dart';
import 'package:bmg/views/home/widgets.dart';
import 'package:bmg/views/search/controllers/controller.dart';
import 'package:bmg/views/search/search_delegate.dart';
import 'package:bmg/views/signup/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchScreenController _searchScreenController =
      Get.put(SearchScreenController());
  final PopularityFilter _popularityFilter = Get.put(PopularityFilter());

  final BookedPromptController _bookedPromptController =
      Get.put(BookedPromptController());
  final RecommendationCardController _recommendationCardController =
      Get.put(RecommendationCardController());

  final int numberOfFilers = 2345;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Appcolors.whitebackground,
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customTextField(
              _searchScreenController.searchBarConroller,
              _searchScreenController.searchBarActive,
              () {
                _searchScreenController.toogleSearchBarColor();
                showSearch(context: context, delegate: ApartmentSearch());
              },
              lableText: 'Search',
              suffixIcon: IconlyLight.filter,
              useSuffix: true,
              leadingIcon: IconlyLight.search,
            ),
            const SizedBox(height: 10),
            GetBuilder(
                init: _popularityFilter,
                builder: (context) {
                  return SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _popularityFilter.populariyClassing.length,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          return contentFilterRow(
                            index,
                            _popularityFilter.isFilterActiveIndex,
                            () {
                              _popularityFilter.activeFilter(index);
                            },
                            _popularityFilter.populariyClassing,
                          );
                        }),
                  );
                }),
            const SizedBox(height: 10),
            smallText16(
              'Filtered ($numberOfFilers)',
              theSize: 18,
              theFontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            GetBuilder(
                init: _recommendationCardController,
                builder: (context) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: _recommendationCardController
                          .recommendedApartments.length,
                      itemBuilder: (BuildContext context, index) {
                        return Obx(
                          () => customListTile(
                            bookedCardOnpressed: () {
                              _bookedPromptController.toggleBookedIcon(index);
                            },
                            index: index,
                            theBookedIcon: _bookedPromptController
                                    .isBookedButtonActiveList[index]
                                ? IconlyBold.bookmark
                                : IconlyBroken.bookmark,
                            theBookedIconColor: _bookedPromptController
                                    .isBookedButtonActiveList[index]
                                ? AppColors.secondaryGreen
                                : AppColors.iconSecondary,
                            recommendedApartmentsImage:
                                _recommendationCardController
                                    .recommendedApartmentsImage[index],
                            recommendedApartments: _recommendationCardController
                                .recommendedApartments[index],
                            recommendedApartmentslocation:
                                _recommendationCardController
                                    .recommendedApartmentslocation[index],
                            apartmentCost: _recommendationCardController
                                .apartmentCost.value,
                          ),
                        );
                      });
                }),
          ],
        ),
      )),
    );
  }
}
