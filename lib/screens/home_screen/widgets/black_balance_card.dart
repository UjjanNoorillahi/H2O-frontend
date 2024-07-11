import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant/const.dart';

class BlackBalanceCardWidget extends StatelessWidget {
  var availableBalance;

  BlackBalanceCardWidget({super.key, required this.availableBalance});

  // This shows a CupertinoModalPopup which hosts a CupertinoAlertDialog.
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Proceed with destructive action?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.90,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 15.0, right: 15.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Available balance',
                    // textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: primaryFont,
                      // fontWeight: FontWeight.w500,
                      // letterSpacing: -0.56,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    // media query

                    height: 35,
                    width: 35,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(24),
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    // write available balance with dollar sign
                    '\$$availableBalance',
                    // textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontFamily: primaryFont,
                      // fontWeight: FontWeight.w500,
                      // letterSpacing: -0.56,
                    ),
                  ),
                ],
              ),
              SizedBox(
                  // height: MediaQuery.of(context).size.height * 0.04,
                  ),
              Row(
                children: [
                  CupertinoButton(
                    onPressed: () => _showAlertDialog(context),
                    child: const Text(
                      // write available balance with dollar sign
                      "See details",
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: primaryFont,
                        // fontWeight: FontWeight.w500,
                        // letterSpacing: -0.56,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
