import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h2o/screens/home_screen/home_screen.dart';
import 'package:intl/intl.dart';

import '../../constant/const.dart';

class MySpending extends StatefulWidget {
  double currentBalance;
  double availableBalanceText;
  MySpending(
      {super.key,
      required this.currentBalance,
      required this.availableBalanceText});

  @override
  State<MySpending> createState() => _MySpendingState();
}

class _MySpendingState extends State<MySpending> {
  double calculateProgressValue() {
    // Calculate the difference between currentBalance and availableBalanceText
    double difference = widget.currentBalance - widget.availableBalanceText;

    // Normalize the difference to a value between 0.0 and 1.0
    double normalizedValue = difference / widget.currentBalance;

    // Ensure that the result is within the valid range
    return normalizedValue.clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    double progressValue = calculateProgressValue();
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('My Spending'),
          leading: CupertinoNavigationBarBackButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            },
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 120, left: 18, right: 18),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
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
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 15.0, right: 15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // Budget for the Current Month...
                              Text(
                                'Budget for ${getCurrentMonth()}',
                                // textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: primaryFont,
                                  // fontWeight: FontWeight.w500,
                                  // letterSpacing: -0.56,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                              // add amount Text
                              const Text(
                                // write available balance with dollar sign
                                "Add amount",
                                // textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'In',
                                  // fontWeight: FontWeight.w500,
                                  // letterSpacing: -0.56,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                // current balance and total Balance
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        // show text with dollor sign

                                        text: '\$${widget.availableBalanceText}'
                                            .toString(),
                                        // text: "1333000",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0.07,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            // add current balance with dollar sign
                                            '/\$${widget.currentBalance}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0.26,
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.1,
                              ),
                              // write text to see more
                            ],
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          // add progress bar
                          LinearProgressIndicator(
                            value: progressValue,
                            // show current balance - available balance

                            minHeight:
                                17.0, // Set the height of the progress bar
                            // set app background color as appPrimaryColor

                            backgroundColor:
                                appGreyColor, // Set the background color
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.white),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(20)), // Set the progress color
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                // Text (This Month Expenses)
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 186,
                        height: 20,
                        child: Text(
                          'Daily Expenses',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: primaryFont,
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),

                // Grey card 2
                Container(
                  height: MediaQuery.of(context).size.height * 0.105,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        top: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        right: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    child: Row(
                      children: [
                        // budget for current month text
                        Padding(
                          padding: const EdgeInsets.all(8.5),
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: const Icon(
                              Icons.wallet,
                              size: 40,
                              color: appPrimaryColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Bus Fair',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                  ),
                                  // add amount
                                  Text(
                                    '\$540.0',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              //Sub text
                              Row(
                                children: [
                                  const Text(
                                    '10 jan 2022',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.40,
                                  ),
                                  // payment mode
                                  const Text(
                                    'Cash',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                        // current month amount and total amount
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),

                // Grey card 1
                Container(
                  height: MediaQuery.of(context).size.height * 0.105,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        top: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        right: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    child: Row(
                      children: [
                        // budget for current month text
                        Padding(
                          padding: const EdgeInsets.all(8.5),
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: const Icon(
                              Icons.wallet,
                              size: 40,
                              color: appPrimaryColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Morning Coffee bill',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.12,
                                  ),
                                  // add amount
                                  Text(
                                    '\$6.0',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              //Sub text
                              Row(
                                children: [
                                  const Text(
                                    '10 jan 2022',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.40,
                                  ),
                                  // payment mode
                                  const Text(
                                    'Cash',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                        // current month amount and total amount
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),

                // Grey card 2
                Container(
                  height: MediaQuery.of(context).size.height * 0.105,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        top: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        right: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    child: Row(
                      children: [
                        // budget for current month text
                        Padding(
                          padding: const EdgeInsets.all(8.5),
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: const Icon(
                              Icons.wallet,
                              size: 40,
                              color: appPrimaryColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Honey Bun',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.27,
                                  ),
                                  // add amount
                                  Text(
                                    '\$1.75',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              //Sub text
                              Row(
                                children: [
                                  const Text(
                                    '10 jan 2022',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.40,
                                  ),
                                  // payment mode
                                  const Text(
                                    'Cash',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                        // current month amount and total amount
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 186,
                        height: 20,
                        child: Text(
                          'Weekly Expenses',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: primaryFont,
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Grey card 1
                Container(
                  height: MediaQuery.of(context).size.height * 0.105,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        top: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        right: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    child: Row(
                      children: [
                        // budget for current month text
                        Padding(
                          padding: const EdgeInsets.all(8.5),
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: const Icon(
                              Icons.wallet,
                              size: 40,
                              color: appPrimaryColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Grocery bill',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.23,
                                  ),
                                  // add amount
                                  Text(
                                    '\$540.0',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              //Sub text
                              Row(
                                children: [
                                  const Text(
                                    '10 jan 2022',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.40,
                                  ),
                                  // payment mode
                                  const Text(
                                    'Cash',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                        // current month amount and total amount
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),

                // Grey card 2
                Container(
                  height: MediaQuery.of(context).size.height * 0.105,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        top: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        right: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    child: Row(
                      children: [
                        // budget for current month text
                        Padding(
                          padding: const EdgeInsets.all(8.5),
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: const Icon(
                              Icons.wallet,
                              size: 40,
                              color: appPrimaryColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Bus Fair',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                  ),
                                  // add amount
                                  Text(
                                    '\$540.0',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              //Sub text
                              Row(
                                children: [
                                  const Text(
                                    '10 jan 2022',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.40,
                                  ),
                                  // payment mode
                                  const Text(
                                    'Cash',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                        // current month amount and total amount
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),

                // Grey card 2
                Container(
                  height: MediaQuery.of(context).size.height * 0.105,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        top: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        right: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    child: Row(
                      children: [
                        // budget for current month text
                        Padding(
                          padding: const EdgeInsets.all(8.5),
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: const Icon(
                              Icons.wallet,
                              size: 40,
                              color: appPrimaryColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Dinner with friends',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.08,
                                  ),
                                  // add amount
                                  Text(
                                    '\$140.0',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              //Sub text
                              Row(
                                children: [
                                  const Text(
                                    '10 jan 2022',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.40,
                                  ),
                                  // payment mode
                                  const Text(
                                    'Cash',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                        // current month amount and total amount
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 186,
                        height: 20,
                        child: Text(
                          'Monthly Expenses',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: primaryFont,
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Grey card 1
                Container(
                  height: MediaQuery.of(context).size.height * 0.105,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        top: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        right: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    child: Row(
                      children: [
                        // budget for current month text
                        Padding(
                          padding: const EdgeInsets.all(8.5),
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: const Icon(
                              Icons.wallet,
                              size: 40,
                              color: appPrimaryColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Electricity bill',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                  ),
                                  // add amount
                                  Text(
                                    '\$540.0',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              //Sub text
                              Row(
                                children: [
                                  const Text(
                                    '10 jan 2022',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.40,
                                  ),
                                  // payment mode
                                  const Text(
                                    'Cash',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                        // current month amount and total amount
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),

                // Grey card 2
                Container(
                  height: MediaQuery.of(context).size.height * 0.105,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        top: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        right: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    child: Row(
                      children: [
                        // budget for current month text
                        Padding(
                          padding: const EdgeInsets.all(8.5),
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: const Icon(
                              Icons.wallet,
                              size: 40,
                              color: appPrimaryColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Gasoline bill',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  // add amount
                                  Text(
                                    '\$540.0',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              //Sub text
                              Row(
                                children: [
                                  const Text(
                                    '10 jan 2022',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.40,
                                  ),
                                  // payment mode
                                  const Text(
                                    'Cash',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                        // current month amount and total amount
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                // Grey card 1
                Container(
                  height: MediaQuery.of(context).size.height * 0.105,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        top: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        right: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          color: appGreyColor,
                          width: 1.0,
                        ),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    child: Row(
                      children: [
                        // budget for current month text
                        Padding(
                          padding: const EdgeInsets.all(8.5),
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: const Icon(
                              Icons.wallet,
                              size: 40,
                              color: appPrimaryColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Monthly Expenses',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  // add amount
                                  Text(
                                    '\$540.0',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              //Sub text
                              Row(
                                children: [
                                  const Text(
                                    '10 jan 2022',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.40,
                                  ),
                                  // payment mode
                                  const Text(
                                    'Cash',
                                    style: TextStyle(
                                      color: Color(0xFF1A202C),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                        // current month amount and total amount
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),

                // Grey card 2
              ],
            ),
          ),
        ));
  }

  String getCurrentMonth() {
    // Get the current date
    DateTime now = DateTime.now();

    // Format the date to get the month name
    String formattedMonth = DateFormat('MMMM').format(now);

    return formattedMonth;
  }
}
