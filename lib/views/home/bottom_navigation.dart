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
                      icon: _buildNavIcon(IconlyBroken.home, 0),
                    ),
                    BottomNavigationBarItem(
                        label: 'Search',
                        icon: _buildNavIcon(IconlyBroken.search, 1)),
                    BottomNavigationBarItem(
                        label: 'Booking',
                        icon: _buildNavIcon(IconlyBroken.document, 2)),
                    BottomNavigationBarItem(
                        label: 'Profile',
                        icon: _buildNavIcon(IconlyBroken.profile, 3)),
                  ]),
            ),
          ),
        ),
        body: Obx(() => IndexedStack(
              index: _bottomNavigationSwitcher.currentIndex.value,
              children: [
                HomeScreen(),
                SearchScreen(),
                BookingScreen(),
                ProfileScreen(),
              ],
            )));
  }

  Widget _buildNavIcon(IconData theIcon, int index) {
    return kcustomIconButton30(
      theIcon: theIcon,
      theColor: _bottomNavigationSwitcher.currentIndex.value == index
          ? AppColors.iconSecondary
          : Appcolors.greyIcon,
    );
  }
}


// Obx(() => PageView(
//             controller: _bottomNavigationSwitcher.pageViewController,
//             onPageChanged: (value) {
//               _bottomNavigationSwitcher.currentIndex(value);
//             },
//             physics: const BouncingScrollPhysics(),
//             children: [
//               HomeScreen(),
//               SearchScreen(),
//               BookingScreen(),
//               ProfileScreen(),
//             ],
//           )),