import 'package:bmg/views/home/widgets/custom_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/page_controller.dart';
import '../views/home/widgets.dart';
import 'app_colors.dart';
import 'appcolors.dart';
import 'asset_path.dart';

final CheckBoxController checkBoxController = Get.put(CheckBoxController());

Widget largeText28(
  String theText, {
  double theSize = 28,
  Color theColor = AppColors.textDark,
}) {
  return Text(
    theText,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: theSize,
      fontWeight: FontWeight.bold,
      color: theColor,
      fontFamily: theFontFamily,
    ),
  );
}

Widget largeText50(
  String theText, {
  double theSize = 50,
  Color theColor = AppColors.textDark,
  TextAlign textAlignment = TextAlign.left,
}) {
  return Text(
    theText,
    textAlign: textAlignment,
    style: TextStyle(
        fontSize: theSize,
        fontWeight: FontWeight.bold,
        color: theColor,
        fontFamily: 'JosefinSans',
        height: 1),
  );
}

Widget smallText16(
  String theText, {
  double theSize = 16,
  Color theColor = AppColors.smallText,
  FontWeight theFontWeight = FontWeight.normal,
}) {
  return Text(
    theText,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: theSize,
        color: theColor,
        fontFamily: theFontFamily,
        fontWeight: theFontWeight),
  );
}

Widget largePrimaryButton(
  String theText,
  Function() onTapped, {
  double thebuttonHeight = 65,
  double theTextSize = 16,
  Color theTextColor = AppColors.buttonText,
  Color theButtonColor = AppColors.iconSecondary,
  double thebuttonRadius = 15,
  bool defaultborderRadius = true,
}) {
  return SizedBox(
    height: thebuttonHeight,
    width: double.infinity,
    child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(theButtonColor),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: defaultborderRadius
                  ? BorderRadius.circular(30)
                  : BorderRadius.circular(thebuttonRadius),
            ))),
        onPressed: onTapped,
        child: Text(
          theText,
          style: TextStyle(
            color: theTextColor,
            fontSize: theTextSize,
            fontWeight: FontWeight.bold,
            fontFamily: theFontFamily,
          ),
        )),
  );
}

//
Widget customOutlinedButton({
  String theText = 'Continue with Facebook',
  Color iconColor = Colors.blue,
  double iconSize = 30,
  IconData theIcon = Icons.facebook,
  bool useImageIcon = false,
  String iconImagePath = googleIcon,
  required Function() onttaped,
}) {
  return SizedBox(
    height: 65,
    width: double.infinity,
    child: OutlinedButton.icon(
      onPressed: onttaped,
      label: smallText16(theText),
      icon: useImageIcon
          ? Image.asset(
              iconImagePath,
              height: 30,
            )
          : Icon(
              theIcon,
              size: iconSize,
              color: iconColor,
            ),
      style: ButtonStyle(
          side: WidgetStateProperty.all(const BorderSide(
            color: AppColors.divider,
            width: 2,
          )),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ))),
    ),
  );
}

//
Widget customDivider(String theText) {
  return Row(
    children: [
      sizedDivider(),
      const SizedBox(width: 10),
      smallText16(
        theText,
        theSize: 18,
      ),
      const SizedBox(width: 10),
      sizedDivider(),
    ],
  );
}

Expanded sizedDivider() {
  return const Expanded(
    child: Divider(
      thickness: 2,
      color: AppColors.divider,
    ),
  );
}

//
Widget clickableRowText(
  Function() ontapped, {
  String thefirstText = "Don't have an account?",
  String theSecondText = "Sign up",
  double theSize = 18,
  FontWeight theFontWeight = FontWeight.normal,
  double theSecondTextSize = 18,
  FontWeight theSecondTextWeight = FontWeight.normal,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      smallText16(
        "$thefirstText  ",
        theColor: Appcolors.greyText,
        theSize: theSize,
        theFontWeight: theFontWeight,
      ),
      GestureDetector(
        onTap: ontapped,
        child: smallText16(
          theSecondText,
          theColor: AppColors.secondaryGreen,
          theSize: theSecondTextSize,
          theFontWeight: theSecondTextWeight,
        ),
      ),
      const SizedBox(
        height: 40,
      )
    ],
  );
}

//
Widget backButton({String theText = ''}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: AppColors.accentTeal,
          )),
      const SizedBox(width: 5),
      smallText16(
        theText,
        theSize: 24,
        theColor: AppColors.accentTeal,
        theFontWeight: FontWeight.bold,
      )
    ],
  );
}

//
Widget customCheckBox() {
  return Obx(() => CupertinoCheckbox(
      side: const BorderSide(
        color: AppColors.accentTeal,
        width: 2.5,
      ),
      activeColor: AppColors.secondaryGreen,
      checkColor: Appcolors.whitebackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      value: checkBoxController.isActive.value,
      onChanged: (value) {
        checkBoxController.toogleCheckBox();
      }));
}

//

Widget outlinedButtonIcons({
  Color iconColor = Colors.blue,
  double iconSize = 40,
  IconData theIcon = Icons.facebook,
  bool useImageIcon = false,
  String iconImagePath = googleIcon,
}) {
  return SizedBox(
    height: 65,
    width: 85,
    child: GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(
              color: Appcolors.greyBorder,
              width: 2,
            )),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: useImageIcon
              ? Image.asset(
                  iconImagePath,
                  height: 30,
                  width: 30,
                )
              : Icon(
                  theIcon,
                  size: iconSize,
                  color: iconColor,
                ),
        ),
      ),
    ),
  );
}

//
Widget customTile(
  Function() onTapped, {
  String theTypeText = 'SMS',
  String theReceiverText = '+23********74',
  IconData theIconPath = Icons.message_rounded,
  Color theBorderColor = AppColors.accentTeal,
}) {
  return GestureDetector(
    onTap: onTapped,
    child: Container(
      padding: const EdgeInsets.all(20),
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Appcolors.whitebackground,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 3,
            color: theBorderColor,
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.secondaryGreen),
              child: Icon(
                theIconPath,
                color: Colors.white,
                size: 30,
              )),
          // Image.asset(theImagePath)),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              smallText16("via $theTypeText",
                  theColor: AppColors.neutralDarkGray),
              smallText16(theReceiverText,
                  theFontWeight: FontWeight.bold, theSize: 20)
            ],
          )
        ],
      ),
    ),
  );
}

//
Widget customListTile({
  required int index,
  required String recommendedApartmentsImage,
  required String recommendedApartments,
  required String recommendedApartmentslocation,
  required int apartmentCost,
  required Function() bookedCardOnpressed,
  Color theBookedIconColor = Appcolors.blackIcon,
  required IconData theBookedIcon,
}) {
  return GestureDetector(
    onTap: bookedCardOnpressed,
    child: customTileListCard(
      theChild: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    colorFilter: const ColorFilter.mode(
                        Color.fromARGB(30, 0, 0, 0), BlendMode.colorBurn),
                    fit: BoxFit.cover,
                    image: AssetImage(
                      recommendedApartmentsImage,
                    ))),
          ),
          const SizedBox(width: 10),
          Expanded(
              flex: 3,
              child: SizedBox(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                          fit: BoxFit.scaleDown,
                          child: smallText16(
                            recommendedApartments,
                            theFontWeight: FontWeight.bold,
                            theColor: Appcolors.blackText,
                          )),
                      const SizedBox(height: 10),
                      FittedBox(
                          fit: BoxFit.scaleDown,
                          child: smallText16(
                            recommendedApartmentslocation,
                            theColor: Appcolors.blackText,
                          )),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.amber,
                          ),
                          FittedBox(
                            child: smallText16('4.8 ',
                                theColor: AppColors.secondaryGreen),
                          ),
                          FittedBox(
                            child: smallText16(' (4,483 views)',
                                theColor: AppColors.secondaryGreen),
                          )
                        ],
                      )
                    ]),
              )),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: smallText16(
                        '\$$apartmentCost',
                        theSize: 26,
                        theFontWeight: FontWeight.bold,
                        theColor: AppColors.accentTeal,
                      )),
                  //const SizedBox(height: 10),
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: smallText16(
                        ' / night',
                        theSize: 14,
                        theColor: Appcolors.blackText,
                      )),
                  const SizedBox(height: 20),

                  kcustomIconButton30(
                    theIcon: theBookedIcon,
                    theColor: theBookedIconColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

//

Widget customGridTile({
  required int index,
  required String recommendedApartmentsImage,
  required String recommendedApartments,
  required String recommendedApartmentslocation,
  required int apartmentCost,
  required Function() bookedCardOnpressed,
  Color theBookedIconColor = Appcolors.blackIcon,
  required IconData theBookedIcon,
}) {
  return GestureDetector(
    onTap: bookedCardOnpressed,
    child: customGridCard(
      theChild: Column(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Align content to the left
        children: [
          // Apartment Image
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                colorFilter: const ColorFilter.mode(
                  Color.fromARGB(30, 0, 0, 0),
                  BlendMode.colorBurn,
                ),
                fit: BoxFit.cover,
                image: AssetImage(
                  recommendedApartmentsImage,
                ),
              ),
            ),
          ),
          const SizedBox(
              height: 10), // Add spacing between the image and details
          // Apartment Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Apartment Name
              FittedBox(
                fit: BoxFit.scaleDown,
                child: smallText16(
                  recommendedApartments,
                  theFontWeight: FontWeight.bold,
                  theColor: Appcolors.blackText,
                ),
              ),
              const SizedBox(height: 4), // Spacing
              // Apartment Location
              FittedBox(
                fit: BoxFit.scaleDown,
                child: smallText16(
                  recommendedApartmentslocation,
                  theColor: Appcolors.blackText,
                ),
              ),
              const SizedBox(height: 6), // Spacing
              // Rating Row
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.amber,
                  ),
                  FittedBox(
                    child:
                        smallText16('4.8 ', theColor: AppColors.secondaryGreen),
                  ),
                  FittedBox(
                    child: smallText16(
                      ' (4,483 views)',
                      theColor: AppColors.secondaryYellow,
                    ),
                  ),
                ],
              ),
              // Cost and Button Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center, // Align center
                children: [
                  // Apartment Cost
                  Row(
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: smallText16(
                          '\$$apartmentCost',
                          theSize: 24,
                          theFontWeight: FontWeight.bold,
                          theColor: AppColors.accentTeal,
                        ),
                      ),
                      const SizedBox(width: 2),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: smallText16(
                          ' / night',
                          theSize: 14,
                          theColor: Appcolors.blackText,
                        ),
                      ),
                    ],
                  ),
                  // Booking Icon Button
                  customIconButton30(
                    theIcon: theBookedIcon,
                    onpressed: bookedCardOnpressed,
                    theIconColor: theBookedIconColor,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

//
Widget customCircleAvatar(Function() ontapped) {
  return GestureDetector(
    onTap: ontapped,
    child: const CircleAvatar(
      radius: 70,
      backgroundColor: AppColors.primaryBeige,
      child: Icon(
        Icons.edit_square,
        size: 30,
        color: AppColors.accentTeal,
      ),
    ),
  );
}

Widget customAvatar() {
  return IconButton(
      onPressed: () {},
      icon: const Icon(
        IconlyBold.profile,
        size: 90,
        color: AppColors.neutralDarkGray,
      ));
}
