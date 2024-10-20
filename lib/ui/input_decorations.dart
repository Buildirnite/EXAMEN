import 'package:flutter/material.dart';

class InputDecortions {
  static InputDecoration authInputDecoration({
    required String hinText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(255, 255, 255, 255),
        )),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(255, 255, 255, 255),
          width: 3,
        )),
        hintText: hinText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: const Color.fromARGB(255, 255, 255, 255),
              )
            : null);
  }
}
