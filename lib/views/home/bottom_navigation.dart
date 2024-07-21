import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/asset_path.dart';
import 'package:homefeel/views/booking/booking_screen.dart';
import 'package:homefeel/views/home/controllers/controller.dart';
import 'package:homefeel/views/home/home_screen.dart';

import 'package:homefeel/views/home/widgets.dart';
import 'package:homefeel/views/profile/profile_screen.dart';
import 'package:homefeel/views/search/search_screen.dart';

class BottomNavigationTab extends StatelessWidget {
  BottomNavigationTab({super.key});

  final BottomNavigationSwitcher _bottomNavigationSwitcher =
      Get.put(BottomNavigationSwitcher());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Appcolors.whitebackground,
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
                  icon: customIcon28(theIconPath: homeIconInactive),
                  activeIcon: customIcon28(theIconPath: homeIconActive)),
              BottomNavigationBarItem(
                  label: 'Search',
                  icon: customIcon28(theIconPath: searchIconInactive),
                  activeIcon: customIcon28(theIconPath: searchIconActive)),
              BottomNavigationBarItem(
                label: 'Booking',
                icon: customIcon28(theIconPath: bookingIconInactive),
                activeIcon: customIcon28(theIconPath: bookingIconActive),
              ),
              BottomNavigationBarItem(
                  label: 'Profile',
                  icon: customIcon28(theIconPath: profileIconInactive),
                  activeIcon: customIcon28(theIconPath: profileIconActive)),
            ]),
      ),
      body: Obx(() => PageView(
            controller: _bottomNavigationSwitcher.pageViewController,
            physics: const BouncingScrollPhysics(),
            children: [
              HomeScreen(),
              const SearchScreen(),
              const BookingScreen(),
              const ProfileScreen(),
            ],
          )),
    );
  }
}
