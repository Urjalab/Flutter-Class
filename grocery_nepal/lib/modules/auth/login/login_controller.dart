import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/app_controller.dart';
import 'package:grocery_nepal/data/api/auth_api.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.rawSnackbar(message: 'All fields are required');
      return;
    }
    isLoading(true);
    try {
      var response = await AuthApi.login(username: email, password: password);
      isLoading(false);
      Get.back();
      Get.rawSnackbar(message: 'Login Successful');
      Get.find<AppController>().login(response);
    } catch (e) {
      isLoading(false);
      print(e.toString());
      String errorMessage;
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = e.toString();
        // errorMessage = 'Failed to load data.';
      }
      Get.rawSnackbar(message: errorMessage);
    }
  }

  @override
  void onClose() {
    passwordController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
