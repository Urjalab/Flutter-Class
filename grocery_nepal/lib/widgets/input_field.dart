import 'package:flutter/material.dart';

import '../constants.dart';

class InputField extends StatelessWidget {
  const InputField(this.label, {this.isPassword = false});

  final String label;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      style: const TextStyle(fontWeight: FontWeight.bold),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: greenColor),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: greenColor, width: 2),
        ),
      ),
    );
  }
}
