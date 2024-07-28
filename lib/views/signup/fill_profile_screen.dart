import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/common/widget.dart';
import 'package:homefeel/controllers/page_controller.dart';
import 'package:homefeel/views/signup/widgets.dart';

class FillProfileScreen extends StatelessWidget {
  FillProfileScreen({super.key});

  final RegFormTextEditControllers textEditControllers =
      Get.put(RegFormTextEditControllers());
  final RegFormTextEditControllers colorController =
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
                        colorController.isFullnameActive, () {
                      colorController.toogleColorFullname();
                    },
                        lableText: 'Fullname',
                        keyboardType: TextInputType.name,
                        usePrefix: false),
                    formHeightBox,
                    customTextField(textEditControllers.username,
                        colorController.isUsernameActive, () {
                      colorController.toogleColorUsername();
                    },
                        lableText: 'Username',
                        keyboardType: TextInputType.name,
                        usePrefix: false),
                    formHeightBox,
                    customTextField(textEditControllers.fullname,
                        colorController.isUserDateOfBirthActive, () {
                      colorController.toogleColorDateOfBirth();
                    },
                        lableText: 'Date of birth',
                        keyboardType: TextInputType.name,
                        usePrefix: false,
                        useSuffix: true),
                    formHeightBox,
                    customTextField(
                      textEditControllers.userEmail,
                      colorController.isUserEmailActive,
                      () {
                        colorController.toogleColorUserEmail();
                      },
                      lableText: 'themail****@mail.com',
                      keyboardType: TextInputType.name,
                      suffixIcon: Icons.mail_rounded,
                      usePrefix: false,
                      useSuffix: true,
                    ),
                    formHeightBox,
                    customTextField(
                      textEditControllers.userGender,
                      colorController.isUserGenderActive,
                      () {
                        colorController.toogleColorUserGender();
                      },
                      lableText: '+23 89 9230 082',
                      keyboardType: TextInputType.name,
                      suffixIcon: Icons.mail_rounded,
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
              height: 30,
            ),
            largePurpleButton('Continue', () {}),
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
              : Appcolors.lightPurpleButton,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                width: 1.5,
                color: textEditControllers.isUserGenderActive.value
                    ? Appcolors.purpleButton
                    : Appcolors.shadeOfGrey,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  width: 1.5,
                  color: textEditControllers.isUserGenderActive.value
                      ? Appcolors.lightPurpleButton
                      : Appcolors.shadeOfGrey)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                width: 1.5,
                color: textEditControllers.isUserGenderActive.value
                    ? Appcolors.purpleButton
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
            color: Appcolors.purpleIcon,
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
