import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/views/booking/booking_screen.dart';
import 'package:homefeel/views/home/controllers/controller.dart';
import 'package:homefeel/views/home/home_screen.dart';

import 'package:homefeel/views/home/widgets.dart';
import 'package:homefeel/views/profile/profile_screen.dart';
import 'package:homefeel/views/search/search_screen.dart';
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
        () => BottomNavigationBar(
            currentIndex: _bottomNavigationSwitcher.currentIndex.value,
            onTap: (value) {
              _bottomNavigationSwitcher.switchTabs(value);
            },
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
                icon: kcustomIconButton30(
                  theIcon: IconlyBroken.home,
                  theColor: Appcolors.greyIcon,
                ),
                activeIcon: kcustomIconButton30(
                  theIcon: IconlyBroken.home,
                  theColor: Appcolors.purpleButton,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Search',
                icon: kcustomIconButton30(
                  theIcon: IconlyBroken.search,
                  theColor: Appcolors.greyIcon,
                ),
                activeIcon: kcustomIconButton30(
                  theIcon: IconlyBroken.search,
                  theColor: Appcolors.purpleButton,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Booking',
                icon: kcustomIconButton30(
                  theIcon: IconlyBroken.document,
                  theColor: Appcolors.greyIcon,
                ),
                activeIcon: kcustomIconButton30(
                  theIcon: IconlyBroken.home,
                  theColor: Appcolors.purpleButton,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: kcustomIconButton30(
                  theIcon: IconlyBroken.profile,
                  theColor: Appcolors.greyIcon,
                ),
                activeIcon: kcustomIconButton30(
                  theIcon: IconlyBroken.profile,
                  theColor: Appcolors.purpleButton,
                ),
              ),
            ]),
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
              const BookingScreen(),
              const ProfileScreen(),
            ],
          )),
    );
  }
}
