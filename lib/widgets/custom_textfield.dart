import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h2o/constant/const.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  CustomTextField({
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28, right: 28),
      // child: TextFormField(
      //   controller: controller,
      //   keyboardType: TextInputType.text,
      //   validator: (value) {
      //     // Your validation logic here
      //     // Example:
      //     // if (value!.isEmpty) {
      //     //   return 'Please enter $labelText';
      //     // }
      //     // return null;
      //   },
      //   decoration: InputDecoration(
      //
      //     labelStyle: TextStyle(
      //       color: Colors.black
      //     ),
      //     labelText: labelText,
      //     contentPadding: const EdgeInsets.all(20),
      //     border: OutlineInputBorder(
      //
      //       borderRadius: BorderRadius.circular(15.0),
      //       borderSide: const BorderSide(
      //         color: Colors.black,
      //         width: 2.0
      //       )
      //     ),
      //   ),
      // ),

      child: CupertinoTextField(
        controller: controller,
        keyboardType: TextInputType.text,
        padding: const EdgeInsets.all(20),
        placeholder: labelText,
        placeholderStyle: TextStyle(
          color: CupertinoColors.placeholderText,
        ),
        style: TextStyle(
          color: Colors.black, // Adjust the text color as needed
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: appGreyColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
