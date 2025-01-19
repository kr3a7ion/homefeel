import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';

Widget customTileCard({required Widget theChild}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    padding: const EdgeInsets.all(15),
    height: 220,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Appcolors.offWhiteBackground,
    ),
    child: theChild,
  );
}

Widget customTileListCard({
  required Widget theChild,
  double theHeight = 150,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    padding: const EdgeInsets.all(15),
    height: theHeight,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Appcolors.offWhiteBackground,
    ),
    child: theChild,
  );
}

//
Widget customGridCard({
  required Widget theChild,
  double theHeight = 600,
}) {
  return Container(
    padding: const EdgeInsets.all(15),
    height: theHeight,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Appcolors.offWhiteBackground,
    ),
    child: theChild,
  );
}
