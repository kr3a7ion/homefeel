import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormFieldBinding implements Bindings {
  @override
  void dependencies() {
    
  }
}

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void onClose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.onClose();
  }

  void login(){

  }
}
