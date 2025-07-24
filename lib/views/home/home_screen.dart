import 'package:bmg/common/app_colors.dart';
import 'package:bmg/common/appcolors.dart';
import 'package:bmg/common/asset_path.dart';
import 'package:bmg/common/widget.dart';
import 'package:bmg/routes/app_routes.dart';
import 'package:bmg/views/home/controllers/booked_prompt_controller.dart';
import 'package:bmg/views/home/controllers/icon_color_controller.dart';
import 'package:bmg/views/home/controllers/popularity_filter_controller.dart';
import 'package:bmg/views/home/controllers/recommend_card_controller.dart';
import 'package:bmg/views/home/controllers/search_bar_controller.dart';

import 'package:bmg/views/home/widgets.dart';
import 'package:bmg/views/signup/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final IconColorSwitcher _iconSwitcher = Get.put(IconColorSwitcher());
  final PopularityFilter _popularityFilter = Get.put(PopularityFilter());
  final SearchBarController _searchBarController =
      Get.put(SearchBarController());
  final RecommendationCardController _recommendationCardController =
      Get.put(RecommendationCardController());
  final BookedPromptController _bookedPromptController =
      Get.put(BookedPromptController());
  final String welcomeName = 'Max';

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
              // custom AppBar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      smallText16(
                        'BMG',
                        theColor: AppColors.accentTeal,
                        theSize: 30,
                        theFontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  Obx(
                    () => Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        customIconButton30(
                          onpressed: () {
                            Get.toNamed(AppRoutes.notificationPromptPageId);
                            _iconSwitcher.toggleNotificationBell();
                          },
                          theIcon: IconlyBroken.notification,
                          theIconColor:
                              _iconSwitcher.notificationBellActive.value
                                  ? AppColors.secondaryGreen
                                  : Appcolors.greyIcon,
                        ),
                        customIconButton30(
                          onpressed: () {
                            _iconSwitcher.toogleBookmarkActive();
                            Get.toNamed(AppRoutes.bookmarkPromptPageID);
                          },
                          theIcon: IconlyBroken.bookmark,
                          theIconColor: _iconSwitcher.bookmarkActive.value
                              ? AppColors.iconSecondary
                              : Appcolors.greyIcon,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),

              // homescreen body content start here
              Row(
                children: [
                  largeText28('Hello, $welcomeName'),
                  kcustomIcon28(
                    () {},
                    theIconPath: waveIcon,
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // customTxtfield for the Search bar
              customTextField(
                _searchBarController.searchBarController,
                _searchBarController.searchBarActive,
                () {
                  _searchBarController.toogleSearchBarColor();
                },
                lableText: 'Search',
                suffixIcon: IconlyLight.filter,
                useSuffix: true,
                leadingIcon: IconlyBroken.search,
              ),
              const SizedBox(height: 15),

              // this getBuilder shows a list of filters in row based on popularity
              GetBuilder(
                  init: _popularityFilter,
                  builder: (context) {
                    return SizedBox(
                      height: 70,
                      width: double.infinity,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
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
              
              // this getBuilder show cards based on recommended apartment deals to user
              GetBuilder(
                  init: _recommendationCardController,
                  builder: (context) {
                    return SizedBox(
                      height: 360,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: _recommendationCardController
                              .recommendedApartments.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, index) {
                            return recommedApartmentCard(
                              index,
                              _recommendationCardController
                                  .recommendedApartmentsImage,
                              _recommendationCardController
                                  .recommendedApartments,
                              _recommendationCardController
                                  .recommendedApartmentslocation,
                            );
                          }),
                    );
                  }),
              const SizedBox(height: 20),

              // this section show's the recently booked apartment in a listview builder
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  smallText16('Recently Booked',
                      theColor: Appcolors.blackText,
                      theFontWeight: FontWeight.bold),
                  clickableRowText(
                    () {
                      Get.toNamed(AppRoutes.bookmarkPromptPageID);
                    },
                    thefirstText: '',
                    theSecondText: 'See all',
                    theSecondTextWeight: FontWeight.bold,
                    theSecondTextSize: 16,
                  )
                ],
              ),
              const SizedBox(height: 15),

              // this GetBuilder handle the list of booked apartments
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

                                _bookedPromptController.addBookedApartment({
                                  'image': _recommendationCardController
                                      .recommendedApartmentsImage[index],
                                  'name': _recommendationCardController
                                      .recommendedApartments[index],
                                  'location': _recommendationCardController
                                      .recommendedApartmentslocation[index],
                                  'cost': _recommendationCardController
                                      .apartmentCost.value,
                                });
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
                              recommendedApartments:
                                  _recommendationCardController
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
        ),
      ),
    );
  }
}
