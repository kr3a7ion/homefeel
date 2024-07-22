import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/asset_path.dart';
import 'package:homefeel/common/widget.dart';
import 'package:homefeel/controllers/homepage_controller.dart';
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
      Get.put(FilterTileorGridController());
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
                () {},
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
                          return customTile(index);
                        });
                  }),
            ],
          ),
        ),
      )),
    );
  }

  Widget customTile(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Appcolors.offWhiteBackground,
      ),
      child: Row(
        children: [
          Container(
            height: 130,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    colorFilter: const ColorFilter.mode(
                        Color.fromARGB(30, 0, 0, 0), BlendMode.colorBurn),
                    fit: BoxFit.cover,
                    image: AssetImage(
                      _recommendationCardController
                          .recommendedApartmentsImage[index],
                    ))),
          ),
          const SizedBox(width: 10),
          Expanded(
              flex: 3,
              child: SizedBox(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                          fit: BoxFit.scaleDown,
                          child: smallText16(
                            _recommendationCardController
                                .recommendedApartments[index],
                            theFontWeight: FontWeight.bold,
                            theColor: Appcolors.blackText,
                          )),
                      const SizedBox(height: 10),
                      FittedBox(
                          fit: BoxFit.scaleDown,
                          child: smallText16(
                            _recommendationCardController
                                .recommendedApartmentslocation[index],
                            theColor: Appcolors.blackText,
                          )),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.amber,
                          ),
                          FittedBox(
                            child: smallText16('4.8 ',
                                theColor: Appcolors.purpleText),
                          ),
                          FittedBox(
                            child: smallText16(' (4,483 views)',
                                theColor: Appcolors.purpleText),
                          )
                        ],
                      )
                    ]),
              )),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: smallText16(
                        '\$29',
                        theSize: 20,
                        theFontWeight: FontWeight.bold,
                        theColor: Appcolors.purpleText,
                      )),
                  //const SizedBox(height: 10),
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: smallText16(
                        ' / night',
                        theSize: 14,
                        theColor: Appcolors.blackText,
                      )),
                  const SizedBox(height: 20),
                  const Icon(
                    IconlyBroken.bookmark,
                    size: 28,
                  ),
                  //kcustomIcon28(() {}, theIconPath: bookmarkedActive)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
