import 'package:flutter/material.dart';

class AvailableBalanceBoxAlertWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Alert"),
      content: Text("This is an alert dialog."),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text("OK"),
        ),
      ],
    );
  }
}
