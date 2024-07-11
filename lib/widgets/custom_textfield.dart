import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final Color textColor;
  final Color boarderColor;
  final Color placeHolderColor;
  final bool obscureText;
  final bool showPassword;

  CustomTextField({
    required this.labelText,
    required this.controller,
    required this.textColor,
    required this.boarderColor,
    required this.placeHolderColor,
    required this.obscureText,
    this.showPassword = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28, right: 28),
      child: CupertinoTextField(
        controller: widget.controller,
        keyboardType: TextInputType.emailAddress,
        padding: const EdgeInsets.all(20),
        placeholder: widget.labelText,
        obscureText: widget.obscureText && _obscureText,
        placeholderStyle: TextStyle(
          color: widget.placeHolderColor,
        ),
        style: TextStyle(
          color: widget.textColor,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.boarderColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        suffix: widget.showPassword
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
//
// class CustomTextField extends StatelessWidget {
//   final String labelText;
//   final TextEditingController controller;
//   final Color textColor;
//   final Color boarderColor;
//   final Color placeHolderColor;
//   final bool obscureText;
//
//   CustomTextField(
//       {required this.labelText,
//       required this.controller,
//       required this.textColor,
//       required this.boarderColor,
//       required this.placeHolderColor,
//       required this.obscureText});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 28, right: 28),
//       child: CupertinoTextField(
//         controller: controller,
//         keyboardType: TextInputType.text,
//         padding: const EdgeInsets.all(20),
//         placeholder: labelText,
//         obscureText: obscureText,
//         placeholderStyle: TextStyle(
//           color: placeHolderColor,
//
//           // CupertinoColors.placeholderText,
//         ),
//         style: TextStyle(
//           color: textColor, // Adjust the text color as needed
//         ),
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: boarderColor,
//             width: 2.0,
//           ),
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//       ),
//     );
//   }
// }
