import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefeel/common/app_colors.dart';
import 'package:homefeel/controllers/page_controller.dart';

final ObscureTextController obscureText = Get.put(ObscureTextController());

Widget customTextField(
  TextEditingController textController,
  TextFieldColorController colorController, {
  String lableText = 'Email',
  TextInputType keyboardType = TextInputType.emailAddress,
  IconData leadingIcon = Icons.mail,
}) {
  return Row(
    children: [
      Expanded(
        child: Obx(
          () => Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    width: 1.5,
                    color: colorController.isActive.value
                        ? Appcolors.purpleButton
                        : Appcolors.shadeOfGrey),
                color: colorController.isActive.value
                    ? Appcolors.lightPurpleButton
                    : Appcolors.shadeOfGrey),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextFormField(
                  keyboardType: keyboardType,
                  controller: textController,
                  onFieldSubmitted: (value) {
                    colorController.isActive.value
                        ? colorController.isActive.value = false
                        : colorController.toogleColor();
                  },
                  onTap: () {
                    colorController.isActive.value
                        ? colorController.isActive.value = true
                        : colorController.toogleColor();
                  },
                  style:
                      const TextStyle(fontSize: 18, color: Appcolors.blackText),
                  maxLines: 1,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      bottom: 12,
                      top: 0,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: lableText,
                    labelStyle: TextStyle(
                        color: colorController.isActive.value
                            ? Appcolors.blackText
                            : Appcolors.greyIcon),
                    prefixIcon: Icon(
                      leadingIcon,
                      color: colorController.isActive.value
                          ? Appcolors.purpleButton
                          : Appcolors.greyIcon,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

//
Widget customPasswordTextField(
  TextEditingController passwordController,
  PasswordTextFieldColorController colorController, {
  String lableText = 'Password',
  IconData leadingIcon = Icons.lock,
}) {
  return Row(
    children: [
      Expanded(
        child: Obx(
          () => Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    width: 1.5,
                    color: colorController.isActive.value
                        ? Appcolors.purpleButton
                        : Appcolors.shadeOfGrey),
                color: colorController.isActive.value
                    ? Appcolors.lightPurpleButton
                    : Appcolors.shadeOfGrey),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: obscureText.isActive.value ? false : true,
                  obscuringCharacter: '●',
                  controller: passwordController,
                  onFieldSubmitted: (value) {
                    colorController.isActive.value
                        ? colorController.isActive.value = false
                        : colorController.toogleColor();
                  },
                  onTap: () {
                    colorController.isActive.value
                        ? colorController.isActive.value = true
                        : colorController.toogleColor();
                  },
                  style:
                      const TextStyle(fontSize: 18, color: Appcolors.blackText),
                  maxLines: 1,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      bottom: 12,
                      top: 0,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: lableText,
                    labelStyle: TextStyle(
                        color: colorController.isActive.value
                            ? Appcolors.blackText
                            : Appcolors.greyIcon),
                    prefixIcon: Icon(
                      leadingIcon,
                      color: colorController.isActive.value
                          ? Appcolors.purpleButton
                          : Appcolors.greyIcon,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          obscureText.toogleObscure();
                        },
                        icon: Icon(
                          obscureText.isActive.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: colorController.isActive.value
                              ? Appcolors.purpleButton
                              : Appcolors.greyIcon,
                        )),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
