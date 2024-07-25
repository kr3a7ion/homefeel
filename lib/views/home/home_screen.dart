import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/asset_path.dart';
import 'package:homefeel/common/widget.dart';
import 'package:homefeel/controllers/homepage_controller.dart';
import 'package:homefeel/views/home/widgets.dart';
import 'package:homefeel/views/signup/widgets.dart';
import 'package:iconly/iconly.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final IconSwitcher _iconSwitcher = Get.put(IconSwitcher());
  final PopularityFilter _popularityFilter = Get.put(PopularityFilter());
  final SearchBarConroller _searchBarConroller = Get.put(SearchBarConroller());
  final RecommendationCardController _recommendationCardController =
      Get.put(RecommendationCardController());
  final String welcomeName = 'Max';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          purpleLogo,
                          height: 40,
                        ),
                        const SizedBox(width: 8),
                        smallText16('HomeFeel',
                            theSize: 20, theFontWeight: FontWeight.bold),
                      ],
                    ),
                    Obx(
                      () => Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          customIconButton30(
                            onpressed: () {
                              _iconSwitcher.toggleNotificationBell();
                            },
                            iconSwitcherActive:
                                _iconSwitcher.notificationBellActive.value,
                            theIcon: IconlyBroken.notification,
                          ),
                          customIconButton30(
                            onpressed: () {
                              _iconSwitcher.toogleBookmarkActive();
                            },
                            iconSwitcherActive:
                                _iconSwitcher.bookmarkActive.value,
                            theIcon: IconlyBroken.bookmark,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
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
                customTextField(
                  _searchBarConroller.searchBarConroller,
                  _searchBarConroller.searchBarActive,
                  () {
                    _searchBarConroller.toogleSearchBarColor();
                  },
                  lableText: 'Search',
                  suffixIcon: IconlyLight.filter,
                  useSuffix: true,
                  leadingIcon: IconlyBroken.search,
                ),
                const SizedBox(height: 15),
                GetBuilder(
                    init: _popularityFilter,
                    builder: (context) {
                      return SizedBox(
                        height: 70,
                        width: double.infinity,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                _popularityFilter.populariyClassing.length,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    smallText16('Recently Booked',
                        theColor: Appcolors.blackText,
                        theFontWeight: FontWeight.bold),
                    clickableRowText(() {
                      debugPrint('See all Clicked');
                    },
                        thefirstText: '',
                        theSecondText: 'See all',
                        theSecondTextWeight: FontWeight.bold,
                        theSecondTextSize: 16)
                  ],
                ),
                const SizedBox(height: 15),
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
                            return customListTile(
                              index: index,
                              recommendedApartmentsImage:
                                  _recommendationCardController
                                      .recommendedApartmentsImage,
                              recommendedApartments:
                                  _recommendationCardController
                                      .recommendedApartments,
                              recommendedApartmentslocation:
                                  _recommendationCardController
                                      .recommendedApartmentslocation,
                              apartmentCost: _recommendationCardController.apartmentCost.value,
                            );
                          });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
