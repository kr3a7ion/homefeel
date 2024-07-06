import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/asset_path.dart';
import 'package:homefeel/common/widget.dart';
import 'package:homefeel/controllers/page_controller.dart';
import 'package:homefeel/views/signup/widgets.dart';

class FillProfileScreen extends StatelessWidget {
  FillProfileScreen({super.key});

  final RegFormTextEditControllers textEditControllers =
      Get.put(RegFormTextEditControllers());
  final TextFieldController colorController = Get.put(TextFieldController());

  final Widget formHeightBox = const SizedBox(height: 25);

  @override
  Widget build(BuildContext context) {
    String dropDownValue = 'one';
    return Scaffold(
      backgroundColor: Appcolors.whitebackground,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            backButton(theText: 'Fill Your Profile'),
            customCircleAvatar(() {}),
            Column(
              children: [
                Form(
                    child: Column(
                  children: [
                    customTextField(textEditControllers.fullname,
                        colorController.isActive, () {
                      colorController.toogleColor();
                    },
                        lableText: 'Fullname',
                        keyboardType: TextInputType.name,
                        usePrefix: false),
                    formHeightBox,
                    customTextField(
                        textEditControllers.username, colorController.isActive, () {
                      colorController.toogleColor();
                    },
                        lableText: 'Username',
                        keyboardType: TextInputType.name,
                        usePrefix: false),
                    formHeightBox,
                    customTextField(
                        textEditControllers.fullname, colorController.isActive, () {
                      colorController.toogleColor();
                    },
                        lableText: 'Date of birth',
                        keyboardType: TextInputType.name,
                        usePrefix: false,
                        useSuffix: true),
                    formHeightBox,
                    customTextField(
                      textEditControllers.fullname,
                      colorController.isActive,
                      () {
                        colorController.toogleColor();
                      },
                      lableText: 'themail****@mail.com',
                      keyboardType: TextInputType.name,
                      suffixIcon: Icons.mail_rounded,
                      usePrefix: false,
                      useSuffix: true,
                    ),
                    formHeightBox,
                    Obx(
                      () => Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 1.5,
                                color:
                                    textEditControllers.isUserGenderActive.value
                                        ? Appcolors.purpleButton
                                        : Appcolors.shadeOfGrey),
                            color: textEditControllers.isUserGenderActive.value
                                ? Appcolors.lightPurpleButton
                                : Appcolors.shadeOfGrey),
                        child: DropdownButton(
                            value: dropDownValue,
                            underline: const SizedBox(),
                            isExpanded: true,
                            dropdownColor: Appcolors.lightPurpleButton,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            items: const [
                              DropdownMenuItem(
                                  value: 'one', child: Text('Male')),
                              DropdownMenuItem(
                                  value: 'two', child: Text('Female'))
                            ],
                            onChanged: (value) {}),
                      ),
                    )
                  ],
                ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            largePurpleButton('Continue', () {}),
          ],
        ),
      )),
    );
  }

  Widget customCircleAvatar(Function() ontapped) {
    return GestureDetector(
      onTap: ontapped,
      child: const CircleAvatar(
        radius: 90,
        backgroundColor: Appcolors.whitebackground,
        backgroundImage: AssetImage(profileImage),
        child: Icon(
          Icons.edit_square,
          size: 40,
          color: Appcolors.shadepurpleButton,
        ),
      ),
    );
  }
}
