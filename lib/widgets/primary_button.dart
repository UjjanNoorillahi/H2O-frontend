import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  PrimaryButton({
    required this.text,
    required this.color,

    required this.onPressed, required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295,
      height: 56,
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),

          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 18, fontFamily: 'Adamina-Regular',
                  fontWeight: FontWeight.w400),
        ),

      ),
    );
  }
}
