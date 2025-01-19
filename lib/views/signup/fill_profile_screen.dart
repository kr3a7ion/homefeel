import 'package:bmg/common/app_colors.dart';
import 'package:bmg/common/appcolors.dart';
import 'package:bmg/common/widget.dart';
import 'package:bmg/controllers/page_controller.dart';
import 'package:bmg/views/signup/widgets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/asset_path.dart';

class FillProfileScreen extends StatelessWidget {
  FillProfileScreen({super.key});

  final RegFormTextEditControllers textEditControllers =
      Get.put(RegFormTextEditControllers());

  final Widget formHeightBox = const SizedBox(height: 25);
  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.whitebackground,
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              largeText28('Fill Your Profile', theColor: AppColors.accentTeal)
            ]),
            customAvatar(),
            Column(
              children: [
                Form(
                    child: Column(
                  children: [
                    customTextField(textEditControllers.fullname,
                        textEditControllers.isFullnameActive, () {
                      textEditControllers.toogleColorFullname();
                    },
                        lableText: 'Fullname',
                        keyboardType: TextInputType.name,
                        usePrefix: false),
                    formHeightBox,
                    customTextField(textEditControllers.username,
                        textEditControllers.isUsernameActive, () {
                      textEditControllers.toogleColorUsername();
                    },
                        lableText: 'Username',
                        keyboardType: TextInputType.name,
                        usePrefix: false),
                    formHeightBox,
                    customTextField(textEditControllers.fullname,
                        textEditControllers.isUserDateOfBirthActive, () {
                      textEditControllers.toogleColorDateOfBirth();
                    },
                        lableText: 'Date of birth',
                        keyboardType: TextInputType.datetime,
                        usePrefix: false,
                        useSuffix: true),
                    formHeightBox,
                    customTextField(
                      textEditControllers.userEmail,
                      textEditControllers.isUserEmailActive,
                      () {
                        textEditControllers.toogleColorUserEmail();
                      },
                      lableText: 'mail****@mail.com',
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon: Icons.mail_rounded,
                      usePrefix: false,
                      useSuffix: true,
                    ),
                    formHeightBox,
                    customTextField(
                      textEditControllers.userGender,
                      textEditControllers.isUserGenderActive,
                      () {
                        textEditControllers.toogleColorUserGender();
                      },
                      lableText: '+23 89 9230 082',
                      keyboardType: TextInputType.phone,
                      usePrefix: false,
                      useSuffix: false,
                    ),
                    formHeightBox,
                    customGenderDropDown(),
                  ],
                ))
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            largePrimaryButton('Continue', () {
              Get.offAllNamed(navPageID);
            }),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      )),
    );
  }

  Obx customGenderDropDown() {
    return Obx(
      () => DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          fillColor: !textEditControllers.isUserGenderActive.value
              ? Appcolors.shadeOfGrey
              : AppColors.backgroundLight,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                width: 1.5,
                color: textEditControllers.isUserGenderActive.value
                    ? AppColors.buttonPrimary
                    : Appcolors.shadeOfGrey,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  width: 1.5,
                  color: textEditControllers.isUserGenderActive.value
                      ? AppColors.buttonPrimary
                      : Appcolors.shadeOfGrey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  width: 1.5,
                  color: textEditControllers.isUserGenderActive.value
                      ? AppColors.neutralLightGray
                      : AppColors.buttonPrimary)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                width: 1.5,
                color: textEditControllers.isUserGenderActive.value
                    ? AppColors.buttonPrimary
                    : Appcolors.shadeOfGrey,
              )),
          // Add more decoration..
        ),
        hint: const Text(
          'Sex',
          style: TextStyle(fontSize: 16),
        ),
        items: genderItems
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select gender.';
          }
          return null;
        },
        onChanged: (value) {
          //Do something when selected item is changed.
        },
        onSaved: (value) {
          //selectedValue = value.toString();
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 10),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down_rounded,
            color: AppColors.accentTeal,
          ),
          iconSize: 40,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            color: Appcolors.whitebackground,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
