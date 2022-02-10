import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/auth/register/register_screen.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:grocery_nepal/widgets/input_field.dart';
import 'package:grocery_nepal/widgets/loading.dart';
import 'package:grocery_nepal/widgets/password_field.dart';

import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text('Enter your credentials.'),
                const SizedBox(
                  height: 40,
                ),
                InputField(
                  "Email",
                  controller: controller.emailController,
                  inputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 20,
                ),
                PasswordField(
                  'Password',
                  controller: controller.passwordController,
                ),
                const SizedBox(
                  height: 50,
                ),
                Obx(
                  () => controller.isLoading.isTrue
                      ? const Loading(
                          size: 100,
                        )
                      : Center(
                          child: CustomButton('Login', () {
                          controller.login();
                        })),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not Registered?'),
                    TextButton(
                        onPressed: () {
                          Get.to(() => RegisterScreen());
                        },
                        child: const Text(
                          'Register Now',
                          style: TextStyle(color: greenColor),
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
