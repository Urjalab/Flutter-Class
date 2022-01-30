import 'package:flutter/material.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:grocery_nepal/widgets/password_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController oldPasswordController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Column(children: [
            PasswordField('Old Password', controller: oldPasswordController),
            const SizedBox(
              height: 10,
            ),
            PasswordField('New Password', controller: newPasswordController),
            const SizedBox(
              height: 10,
            ),
            PasswordField('Confirm Password',
                controller: confirmPasswordController),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: CustomButton('Change Password', () {
                if (oldPasswordController.text.trim().isEmpty &&
                    newPasswordController.text.trim().isEmpty &&
                    confirmPasswordController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('All fields are required.'),
                    ),
                  );
                } else if (newPasswordController.text.trim() ==
                    confirmPasswordController.text.trim()) {
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Password didn\'t match.')));
                }
              }),
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
