import 'package:bmg/common/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../common/widget.dart';
import 'custom_card.dart';

Widget notificationCards({
  required IconData theIcon,
  required Color theIconColor,
  required Color theIconBackgroundColor,
  required String theCardStatus,
  required String theCardDescription,
}) {
  return customTileListCard(
    theHeight: 120,
    theChild: Row(
      spacing: 15,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: theIconBackgroundColor,
              borderRadius: BorderRadius.circular(100)),
          child: Icon(
            theIcon,
            size: 30,
            color: theIconColor,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            smallText16(theCardStatus, theSize: 20),
            FittedBox(
              fit: BoxFit.contain,
              child: smallText16(theCardDescription,
                  theColor: Appcolors.greyText, theSize: 13.5),
            )
          ],
        ),
      ],
    ),
  );
}
