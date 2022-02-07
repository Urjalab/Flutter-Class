import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class InputField extends StatelessWidget {
  const InputField(this.label,
      {this.inputType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      this.controller});

  final String label;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      textInputAction: textInputAction,
      // style: const TextStyle(fontWeight: FontWeight.bold),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        labelText: label,
        labelStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: greenColor, width: 2),
        ),
      ),
    );
  }
}
