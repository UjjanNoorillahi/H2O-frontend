import 'package:flutter/material.dart';

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
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        validator: (value) {
          // Your validation logic here
          // Example:
          // if (value!.isEmpty) {
          //   return 'Please enter $labelText';
          // }
          // return null;
        },
        decoration: InputDecoration(

          labelStyle: TextStyle(
            color: Colors.black
          ),
          labelText: labelText,
          contentPadding: const EdgeInsets.all(20),
          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2.0
            )
          ),
        ),
      ),
    );
  }
}
