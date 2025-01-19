import 'dart:io';

import 'package:bmg/common/app_colors.dart';
import 'package:bmg/common/appcolors.dart';
import 'package:bmg/views/booking/booking_screen.dart';
import 'package:bmg/views/home/controllers/controller.dart';
import 'package:bmg/views/home/home_screen.dart';
import 'package:bmg/views/home/widgets.dart';
import 'package:bmg/views/profile/profile_screen.dart';
import 'package:bmg/views/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class BottomNavigationTab extends StatelessWidget {
  BottomNavigationTab({super.key});

  final BottomNavigationSwitcher _bottomNavigationSwitcher =
      Get.put(BottomNavigationSwitcher());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Obx(
        () => Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Appcolors.whitebackground,
          ),
          child: SizedBox(
            height: Platform.isIOS ? 100 : 70,
            child: BottomNavigationBar(
                backgroundColor: Appcolors.whitebackground,
                currentIndex: _bottomNavigationSwitcher.currentIndex.value,
                onTap: (value) {
                  _bottomNavigationSwitcher.switchTabs(value);
                },
                useLegacyColorScheme: false,
                showUnselectedLabels: true,
                unselectedFontSize: 12,
                unselectedLabelStyle: TextStyle(color: Appcolors.greyText),
                selectedLabelStyle:
                    const TextStyle(color: AppColors.iconSecondary),
                items: [
                  BottomNavigationBarItem(
                    label: 'Home',
                    icon: kcustomIconButton30(
                      theIcon: IconlyBroken.home,
                      theColor:
                          _bottomNavigationSwitcher.currentIndex.value == 0
                              ? AppColors.iconSecondary
                              : Appcolors.greyIcon,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Search',
                    icon: kcustomIconButton30(
                      theIcon: IconlyBroken.search,
                      theColor:
                          _bottomNavigationSwitcher.currentIndex.value == 1
                              ? AppColors.iconSecondary
                              : Appcolors.greyIcon,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Booking',
                    icon: kcustomIconButton30(
                      theIcon: IconlyBroken.document,
                      theColor:
                          _bottomNavigationSwitcher.currentIndex.value == 2
                              ? AppColors.iconSecondary
                              : Appcolors.greyIcon,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Profile',
                    icon: kcustomIconButton30(
                      theIcon: IconlyBroken.profile,
                      theColor:
                          _bottomNavigationSwitcher.currentIndex.value == 3
                              ? AppColors.iconSecondary
                              : Appcolors.greyIcon,
                    ),
                  ),
                ]),
          ),
        ),
      ),
      body: Obx(() => PageView(
            controller: _bottomNavigationSwitcher.pageViewController,
            onPageChanged: (value) {
              _bottomNavigationSwitcher.currentIndex(value);
            },
            physics: const BouncingScrollPhysics(),
            children: [
              HomeScreen(),
              SearchScreen(),
              BookingScreen(),
              ProfileScreen(),
            ],
          )),
    );
  }
}
