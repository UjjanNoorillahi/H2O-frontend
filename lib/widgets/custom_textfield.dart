import 'package:flutter/cupertino.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final Color textColor;
  final Color boarderColor;
  final Color placeHolderColor;
  final bool obscureText;

  CustomTextField(
      {required this.labelText,
      required this.controller,
      required this.textColor,
      required this.boarderColor,
      required this.placeHolderColor,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28, right: 28),
      child: CupertinoTextField(
        controller: controller,
        keyboardType: TextInputType.text,
        padding: const EdgeInsets.all(20),
        placeholder: labelText,
        obscureText: obscureText,
        placeholderStyle: TextStyle(
          color: placeHolderColor,

          // CupertinoColors.placeholderText,
        ),
        style: TextStyle(
          color: textColor, // Adjust the text color as needed
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: boarderColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
