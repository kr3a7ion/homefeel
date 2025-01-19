import 'package:bmg/common/app_colors.dart';
import 'package:bmg/common/widget.dart';
import 'package:bmg/views/booking/controllers/controller.dart';
import 'package:bmg/views/booking/widget.dart';
import 'package:bmg/views/home/controllers/recommend_card_controller.dart';
import 'package:bmg/views/home/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../common/appcolors.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});

  final ActiveIcon _activeSearchIcon = Get.put(ActiveIcon());
  final BookingFilter _bookingFiler = Get.put(BookingFilter());
  final RecommendationCardController _recommendationCardController =
      Get.put(RecommendationCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Appcolors.whitebackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  smallText16('My Booking',
                      theColor: AppColors.accentTeal,
                      theSize: 24,
                      theFontWeight: FontWeight.bold),
                  Obx(
                    () => Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        customIconButton30(
                          theIcon: IconlyBroken.search,
                          onpressed: () {
                            _activeSearchIcon.switchActiveIconState();
                          },
                          theIconColor: _activeSearchIcon.isIconActive.value
                              ? AppColors.iconSecondary
                              : Appcolors.greyIcon,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              GetBuilder(
                  init: _bookingFiler,
                  builder: (context) {
                    return SizedBox(
                      height: 70,
                      width: double.infinity,
                      child: ListView.builder(
                          padding: const EdgeInsets.only(left: 10),
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: _bookingFiler.bookingFilter.length,
                          itemBuilder: (
                            BuildContext context,
                            int index,
                          ) {
                            return contentFilterRow(
                              index,
                              _bookingFiler.isFilterActiveIndex,
                              () {
                                _bookingFiler.activeFilter(index);
                              },
                              _bookingFiler.bookingFilter,
                            );
                          }),
                    );
                  }),
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
                          return bookingCustomTile(
                            index: index,
                            recommendedApartmentsImage:
                                _recommendationCardController
                                    .recommendedApartmentsImage,
                            recommendedApartments: _recommendationCardController
                                .recommendedApartments,
                            recommendedApartmentslocation:
                                _recommendationCardController
                                    .recommendedApartmentslocation,
                            paymentStatus: 'Paid',
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
