import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final Color textColor;
  final Color boarderColor;
  final Color placeHolderColor;
  final bool obscureText;

  CustomPasswordTextField({
    required this.labelText,
    required this.controller,
    required this.textColor,
    required this.boarderColor,
    required this.placeHolderColor,
    required this.obscureText,
  });

  @override
  _CustomPasswordTextFieldState createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  String passwordStrength = '';
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updatePasswordStrength);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updatePasswordStrength);
    super.dispose();
  }

  void _updatePasswordStrength() {
    setState(() {
      passwordStrength = _checkPasswordStrength(widget.controller.text);
    });
  }

  String _checkPasswordStrength(String value) {
    if (value.length < 8) {
      return 'Password must be at least 8 characters long.';
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter.';
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit.';
    } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    } else {
      return 'Password strength: Strong';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28, right: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoTextField(
            controller: widget.controller,
            keyboardType: TextInputType.text,
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
            suffix: Padding(
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
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            passwordStrength,
            style: passwordStrength.contains('Password strength: Strong')
                ? TextStyle(color: Colors.green)
                : TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class CustomPasswordTextField extends StatefulWidget {
//   final String labelText;
//   final TextEditingController controller;
//   final Color textColor;
//   final Color boarderColor;
//   final Color placeHolderColor;
//   final bool obscureText;
//
//   CustomPasswordTextField({
//     required this.labelText,
//     required this.controller,
//     required this.textColor,
//     required this.boarderColor,
//     required this.placeHolderColor,
//     required this.obscureText,
//   });
//
//   @override
//   _CustomPasswordTextFieldState createState() =>
//       _CustomPasswordTextFieldState();
// }
//
// class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
//   String passwordStrength = '';
//
//   @override
//   void initState() {
//     super.initState();
//     widget.controller.addListener(_updatePasswordStrength);
//   }
//
//   @override
//   void dispose() {
//     widget.controller.removeListener(_updatePasswordStrength);
//     super.dispose();
//   }
//
//   void _updatePasswordStrength() {
//     setState(() {
//       passwordStrength = _checkPasswordStrength(widget.controller.text);
//     });
//   }
//
//   String _checkPasswordStrength(String value) {
//     if (value.length < 8) {
//       return 'Password must be at least 8 characters long.';
//     } else if (!value.contains(RegExp(r'[A-Z]'))) {
//       return 'Password must contain at least one uppercase letter.';
//     } else if (!value.contains(RegExp(r'[a-z]'))) {
//       return 'Password must contain at least one lowercase letter.';
//     } else if (!value.contains(RegExp(r'[0-9]'))) {
//       return 'Password must contain at least one digit.';
//     } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
//       return 'Password must contain at least one special character.';
//     } else {
//       return 'Password strength: Strong';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 28, right: 28),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CupertinoTextField(
//             controller: widget.controller,
//             keyboardType: TextInputType.text,
//             padding: const EdgeInsets.all(20),
//             placeholder: widget.labelText,
//             obscureText: widget.obscureText,
//             placeholderStyle: TextStyle(
//               color: widget.placeHolderColor,
//             ),
//             style: TextStyle(
//               color: widget.textColor,
//             ),
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: widget.boarderColor,
//                 width: 2.0,
//               ),
//               borderRadius: BorderRadius.circular(15.0),
//             ),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Text(
//             passwordStrength,
//             style: passwordStrength.contains('Password strength: Strong')
//                 ? TextStyle(color: Colors.green)
//                 : TextStyle(color: Colors.red),
//           ),
//         ],
//       ),
//     );
//   }
// }
