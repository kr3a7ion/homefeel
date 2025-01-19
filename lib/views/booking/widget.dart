import 'package:bmg/common/app_colors.dart';
import 'package:bmg/common/appcolors.dart';
import 'package:bmg/common/widget.dart';
import 'package:bmg/views/booking/controllers/controller.dart';
import 'package:bmg/views/home/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget bookingCustomTile({
  required int index,
  required List recommendedApartmentsImage,
  required List recommendedApartments,
  required List recommendedApartmentslocation,
  required String paymentStatus,
}) {
  final TileButtonController tileButtonController = Get.put(
    TileButtonController(),
    tag: index.toString(),
  );
  return customTileCard(
    theChild: Column(
      children: [
        Row(
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
                        Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.buttonPrimary),
                          child: Center(
                            child: FittedBox(
                              child: smallText16(paymentStatus,
                                  theColor: AppColors.buttonText, theSize: 14),
                            ),
                          ),
                        )
                      ]),
                )),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          color: Appcolors.transparentBlack,
        ),
        const SizedBox(
          height: 5,
        ),
        Obx(
          () => Row(
            children: [
              customOutlinedButton(
                isButtonActive: tileButtonController.isCancelButtonActive.value,
                onpressed: () => tileButtonController.toogleCancelButton(),
                theButtonText: 'Cancel Booking',
              ),
              const SizedBox(width: 10),
              customOutlinedButton(
                isButtonActive: tileButtonController.isTicketButtonActive.value,
                onpressed: () => tileButtonController.toogleTicketButton(),
                theButtonText: 'View Ticket',
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget customOutlinedButton({
  required bool isButtonActive,
  required Function onpressed,
  required String theButtonText,
}) {
  return Expanded(
    child: SizedBox(
      height: 40,
      width: 170,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: isButtonActive
                  ? AppColors.accentTeal
                  : Appcolors.whitebackground,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ).copyWith(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                side: const BorderSide(
                  color: AppColors.accentTeal,
                  width: 3,
                ),
              )),
          onPressed: () => onpressed(),
          child: smallText16(
            theButtonText,
            theColor:
                isButtonActive ? Appcolors.whiteText : Appcolors.purpleText,
          )),
    ),
  );
}
