import 'package:flutter/material.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/asset_path.dart';
import 'package:homefeel/common/widget.dart';

IconButton customIcon32(
  Function() onTapped, {
  double theHeight = 28,
  required String theIconPath,
}) {
  return IconButton(
      onPressed: onTapped,
      icon: Image.asset(
        theIconPath,
        height: theHeight,
      ));
}

Widget customIcon28( {
  double theHeight = 28,
  required String theIconPath,
}) {
  return SizedBox(
        height: theHeight,
        child: Image.asset(
          theIconPath,
          height: theHeight,
        ),
      );
}

Widget recommedApartmentCard(
  int index,
  List recommendedApartmentsImage,
  List recommendedApartments,
  List recommendedApartmentslocation,
) {
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
                recommendedApartmentsImage[index],
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
                  child: largeText28(recommendedApartments[index],
                      theColor: Appcolors.whiteText),
                ),
                const SizedBox(height: 5),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: smallText16(recommendedApartmentslocation[index],
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

Widget starRatingOnCard() {
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

Widget contentFilterRow(int index, int isFilterActiveIndex, Function activeFilter, List populariyClassing,) {
  return Row(
    children: [
      SizedBox(
        height: 40,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: isFilterActiveIndex == index
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
              activeFilter();
            },
            child: smallText16(
              populariyClassing[index],
              theColor: isFilterActiveIndex == index
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
