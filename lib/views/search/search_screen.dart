import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/widget.dart';
import 'package:homefeel/views/home/controllers/homepage_controller.dart';
import 'package:homefeel/views/home/widgets.dart';
import 'package:homefeel/views/search/controllers/controller.dart';
import 'package:homefeel/views/signup/widgets.dart';
import 'package:iconly/iconly.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchScreenController _searchScreenController =
      Get.put(SearchScreenController());
  final PopularityFilter _popularityFilter = Get.put(PopularityFilter());
  final FilterTileorGridController _filterTileorGridController =
      Get.put(FilterTileorGridController(),);
  final RecommendationCardController _recommendationCardController =
      Get.put(RecommendationCardController());

  final int numberOfFilers = 2345;
  final String _gridView = 'grid';
  final String _tileView = 'tile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              customTextField(
                _searchScreenController.searchBarConroller,
                _searchScreenController.searchBarActive,
                () {
                  _searchScreenController.toogleSearchBarColor();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  smallText16(
                    'Filtered ($numberOfFilers)',
                    theSize: 18,
                    theFontWeight: FontWeight.bold,
                  ),
                  Obx(
                    () => Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              _filterTileorGridController
                                  .toogleActiveDisplay(_tileView);
                            },
                            icon: Icon(
                              color: _filterTileorGridController
                                          .filterDisplayTypeActive.value ==
                                      _tileView
                                  ? Appcolors.purpleButton
                                  : Appcolors.blackIcon,
                              IconlyLight.paper,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {
                              _filterTileorGridController
                                  .toogleActiveDisplay(_gridView);
                            },
                            icon: Icon(
                              color: _filterTileorGridController
                                          .filterDisplayTypeActive.value ==
                                      _gridView
                                  ? Appcolors.purpleButton
                                  : Appcolors.blackIcon,
                              IconlyLight.category,
                              size: 30,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
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
                            recommendedApartments: _recommendationCardController
                                .recommendedApartments,
                            recommendedApartmentslocation:
                                _recommendationCardController
                                    .recommendedApartmentslocation,
                            apartmentCost: _recommendationCardController
                                .apartmentCost.value,
                          );
                        });
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
