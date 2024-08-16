import 'package:flutter/material.dart';

class CustomLabeledTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Color labelColor;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsetsGeometry contentPadding;

  const CustomLabeledTextFormField({
    Key? key,
    required this.label,
    required this.controller,
    this.labelColor = Colors.black,
    this.fontSize = 16.0,
    this.fontFamily = 'DefaultFont',
    this.fontWeight = FontWeight.w600,
    this.borderColor = Colors.black,
    this.borderWidth = 2.0,
    this.borderRadius = 8.0,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: labelColor,
            fontSize: fontSize,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: contentPadding,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: borderColor,
                width: borderWidth,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
