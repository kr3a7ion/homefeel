import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/asset_path.dart';
import 'package:homefeel/controllers/page_controller.dart';
import 'package:homefeel/views/home/widgets.dart';
import 'package:iconly/iconly.dart';

final CheckBoxController checkBoxController = Get.put(CheckBoxController());

Widget largeText28(
  String theText, {
  double theSize = 28,
  Color theColor = Appcolors.blackText,
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

Widget largeText60(
  String theText, {
  double theSize = 50,
  Color theColor = Appcolors.blackText,
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
  Color theColor = Appcolors.blackText,
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

Widget largePurpleButton(
  String theText,
  Function() onTapped, {
  double thebuttonHeight = 50,
  double theTextSize = 16,
  Color theTextColor = Appcolors.whiteText,
  Color theButtonColor = Appcolors.purpleButton,
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
}) {
  return SizedBox(
    height: 65,
    width: double.infinity,
    child: OutlinedButton.icon(
      onPressed: () {},
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
            color: Appcolors.greyBorder,
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
      color: Appcolors.greyBorder,
    ),
  );
}

//
Widget clickableRowText(
  Function() ontapped, {
  String thefirstText = "Don't have an account?",
  String theSecondText = "Sign up",
  //Color theColor = Appcolors.greyBorder,
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
          theColor: Appcolors.purpleText,
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
            size: 28,
          )),
      const SizedBox(width: 5),
      smallText16(
        theText,
        theSize: 28,
        theFontWeight: FontWeight.bold,
      )
    ],
  );
}

//
Widget customCheckBox() {
  return Obx(() => CupertinoCheckbox(
      side: const BorderSide(
        color: Appcolors.purpleButton,
        width: 2.5,
      ),
      activeColor: Appcolors.purpleIcon,
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
  String theImagePath = messageIcon,
  Color theBorderColor = Appcolors.purpleButton,
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
                  color: Appcolors.lightPurpleButton),
              child: Image.asset(theImagePath)),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              smallText16("via $theTypeText", theColor: Appcolors.greyText),
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
  required List recommendedApartmentsImage,
  required List recommendedApartments,
  required List recommendedApartmentslocation,
  required int apartmentCost,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    padding: const EdgeInsets.all(15),
    height: 150,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Appcolors.offWhiteBackground,
    ),
    child: Row(
      children: [
        Container(
          height: 130,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  colorFilter: const ColorFilter.mode(
                      Color.fromARGB(30, 0, 0, 0), BlendMode.colorBurn),
                  fit: BoxFit.cover,
                  image: AssetImage(
                    recommendedApartmentsImage[index],
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
                          recommendedApartments[index],
                          theFontWeight: FontWeight.bold,
                          theColor: Appcolors.blackText,
                        )),
                    const SizedBox(height: 10),
                    FittedBox(
                        fit: BoxFit.scaleDown,
                        child: smallText16(
                          recommendedApartmentslocation[index],
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
                              theColor: Appcolors.purpleText),
                        ),
                        FittedBox(
                          child: smallText16(' (4,483 views)',
                              theColor: Appcolors.purpleText),
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
                      theColor: Appcolors.purpleText,
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
                  theIcon: IconlyBroken.bookmark,
                  theColor: Appcolors.blackIcon,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

//
Widget customCircleAvatar(Function() ontapped) {
  return GestureDetector(
    onTap: ontapped,
    child: const CircleAvatar(
      radius: 80,
      backgroundColor: Appcolors.whitebackground,
      backgroundImage: AssetImage(profileImage),
      child: Icon(
        Icons.edit_square,
        size: 30,
        color: Appcolors.shadepurpleButton,
      ),
    ),
  );
}
