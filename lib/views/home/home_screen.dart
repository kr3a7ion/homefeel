import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/asset_path.dart';
import 'package:homefeel/common/widget.dart';
import 'package:homefeel/controllers/homepage_controller.dart';
import 'package:homefeel/views/home/widgets.dart';
import 'package:homefeel/views/signup/widgets.dart';

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
      backgroundColor: Appcolors.whitebackground,
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
                          height: 30,
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
                          customIcon32(
                              () => _iconSwitcher.toggleNotificationBell(),
                              theIconPath:
                                  _iconSwitcher.notificationBellActive.value
                                      ? notificationBellInactive
                                      : notificationBellActive),
                          customIcon32(
                              () => _iconSwitcher.toogleBookmarkActive(),
                              theIconPath: _iconSwitcher.bookmarkActive.value
                                  ? bookmarkedInactive
                                  : bookmarkedActive),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    largeText28('Hello, $welcomeName'),
                    customIcon32(
                      () {},
                      theIconPath: waveIcon,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                customTextField(
                  _searchBarConroller.searchBarConroller,
                  _searchBarConroller.searchBarActive,
                  () {},
                  lableText: 'Search',
                  suffixIcon: Icons.filter_list_alt,
                  useSuffix: true,
                  leadingIcon: Icons.search,
                ),
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
                              return contentFilterRow(index);
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
                              return recommedApartmentCard(index);
                            }),
                      );
                    }),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    smallText16('Recently Booked',
                        theSize: 16,
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
                                                Color.fromARGB(30, 0, 0, 0),
                                                BlendMode.colorBurn),
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                              _recommendationCardController
                                                      .recommendedApartmentsImage[
                                                  index],
                                            ))),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                      flex: 3,
                                      child: SizedBox(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: smallText16(
                                                    _recommendationCardController
                                                            .recommendedApartments[
                                                        index],
                                                    theFontWeight:
                                                        FontWeight.bold,
                                                    theColor:
                                                        Appcolors.blackText,
                                                  )),
                                              const SizedBox(height: 10),
                                              FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: smallText16(
                                                    _recommendationCardController
                                                            .recommendedApartmentslocation[
                                                        index],
                                                    theColor:
                                                        Appcolors.blackText,
                                                  )),
                                              const SizedBox(height: 10),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.baseline,
                                                textBaseline:
                                                    TextBaseline.alphabetic,
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    size: 16,
                                                    color: Colors.amber,
                                                  ),
                                                  FittedBox(
                                                    child: smallText16('4.8 ',
                                                        theColor: Appcolors
                                                            .purpleText),
                                                  ),
                                                  FittedBox(
                                                    child: smallText16(
                                                        ' (4,483 views)',
                                                        theColor: Appcolors
                                                            .purpleText),
                                                  )
                                                ],
                                              )
                                            ]),
                                      )),
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                          // const SizedBox(height: 10),
                                          customIcon32(() {},
                                              theIconPath: bookmarkedActive)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          useLegacyColorScheme: false,
          showUnselectedLabels: true,
          unselectedFontSize: 12,
          unselectedLabelStyle: TextStyle(color: Appcolors.greyText),
          selectedFontSize: 12,
          selectedLabelStyle: const TextStyle(color: Appcolors.purpleText),
          fixedColor: Colors.amber,
          items: [
            BottomNavigationBarItem(
                label: 'Home',
                icon: customIcon32(() {}, theIconPath: homeIconInactive),
                activeIcon: customIcon32(() {}, theIconPath: homeIconActive)),
            BottomNavigationBarItem(
                label: 'Search',
                icon: customIcon32(() {}, theIconPath: searchIconInactive),
                activeIcon: customIcon32(() {}, theIconPath: searchIconActive)),
            BottomNavigationBarItem(
              label: 'Booking',
              icon: customIcon32(() {}, theIconPath: bookingIconInactive),
              activeIcon: customIcon32(() {}, theIconPath: bookingIconActive),
            ),
            BottomNavigationBarItem(
                label: 'Profile',
                icon: customIcon32(() {}, theIconPath: profileIconInactive),
                activeIcon:
                    customIcon32(() {}, theIconPath: profileIconActive)),
          ]),
    );
  }

  Widget recommedApartmentCard(int index) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(25),
          height: 350,
          width: 280,
          decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: const ColorFilter.mode(
                    Appcolors.transparentBlack, BlendMode.colorBurn),
                fit: BoxFit.cover,
                image: AssetImage(
                  _recommendationCardController
                      .recommendedApartmentsImage[index],
                )),
            color: Appcolors.shadepurpleButton,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              starRatingOnCard(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: largeText28(
                        _recommendationCardController
                            .recommendedApartments[index],
                        theColor: Appcolors.whiteText),
                  ),
                  const SizedBox(height: 5),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: smallText16(
                        _recommendationCardController
                            .recommendedApartmentslocation[index],
                        theColor: Appcolors.whiteText),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          largeText28('\$29',
                              theSize: 24, theColor: Appcolors.whiteText),
                          smallText16(' /per night',
                              theSize: 14,
                              theColor: Appcolors.whiteText,
                              theFontWeight: FontWeight.bold),
                        ],
                      ),
                      customIcon32(() {}, theIconPath: whiteBookmarkedIcon)
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }

  Container starRatingOnCard() {
    return Container(
      height: 25,
      width: 60,
      decoration: BoxDecoration(
        color: Appcolors.purpleButton,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.star,
            color: Appcolors.whitebackground,
            size: 14,
          ),
          const SizedBox(width: 5),
          smallText16('4.8', theSize: 14, theColor: Appcolors.whiteText)
        ],
      ),
    );
  }

  Widget contentFilterRow(int index) {
    return Row(
      children: [
        SizedBox(
          height: 40,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _popularityFilter.isFilterActiveIndex == index
                          ? Appcolors.purpleButton
                          : Appcolors.whitebackground,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ).copyWith(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    side: const BorderSide(
                      color: Appcolors.purpleButton,
                      width: 3,
                    ),
                  )),
              onPressed: () {
                _popularityFilter.activeFilter(index);
              },
              child: smallText16(
                _popularityFilter.populariyClassing[index],
                theColor: _popularityFilter.isFilterActiveIndex == index
                    ? Appcolors.whiteText
                    : Appcolors.purpleText,
              )),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
