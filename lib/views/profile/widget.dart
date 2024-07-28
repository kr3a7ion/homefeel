//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/views/profile/controller/controllers.dart';

Widget customProfileTile({
  required Function() ontapped,
  required IconData theIcon,
  required String theText,
  Color theIconColor = Appcolors.blackIcon,
  Color theTextColor = Appcolors.blackText,
}) {
  return ListTile(
    onTap: ontapped,
    contentPadding: EdgeInsets.zero,
    leading: Icon(
      theIcon,
      size: 26,
      color: theIconColor,
    ),
    title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          theText,
          style: TextStyle(
            fontSize: 16,
            color: theTextColor,
          ),
        )),
  );
}

//
Widget darkModetile({
  required IconData theIcon,
  required String theText,
  Color theIconColor = Appcolors.blackIcon,
  Color theTextColor = Appcolors.blackText,
}) {
  final ProfileToogleDarkmode toogleDarkmode = Get.put(ProfileToogleDarkmode());
  return Obx(
    () => ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        theIcon,
        size: 26,
        color: theIconColor,
      ),
      title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            theText,
            style: TextStyle(
              fontSize: 16,
              color: theTextColor,
            ),
          )),
      trailing: Switch.adaptive(
          activeColor: Appcolors.purpleButton,
          value: toogleDarkmode.isDarkMode.value,
          onChanged: (value) {
            toogleDarkmode.toogleDarkMode(value);
          }),
    ),
  );
}
