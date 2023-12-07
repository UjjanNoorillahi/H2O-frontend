import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GreyBalanceCardWidget extends StatelessWidget {
  double currentBalance;

  double availableBalanceText;

  GreyBalanceCardWidget(
      {super.key,
      required this.currentBalance,
      required this.availableBalanceText});

  double calculateProgressValue() {
    // Calculate the difference between currentBalance and availableBalanceText
    double difference = currentBalance - availableBalanceText;

    // Normalize the difference to a value between 0.0 and 1.0
    double normalizedValue = difference / currentBalance;

    // Ensure that the result is within the valid range
    return normalizedValue.clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    double progressValue = calculateProgressValue();

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.105,
      width: MediaQuery.of(context).size.width * 0.90,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Color(0xFFBBBDBE),
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 15.0, right: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
// budget for current month text
                  Text(
                    'Budget for ${getCurrentMonth()}',
// textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
// letterSpacing: -0.56,
                    ),
                  ),
                ],
              ),
// current month amount and total amount
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 140,
                    height: 8.85,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
// show text with dollor sign

                            text: '\$$availableBalanceText',
                            style: const TextStyle(
                              color: Color(0xFF030303),
                              fontSize: 19,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.07,
                            ),
                          ),
                          TextSpan(
                            text: '/\$$currentBalance',
                            style: const TextStyle(
                              color: Color(0xFF030303),
                              fontSize: 10,
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
                ],
              ),

              const Text(
                'view your spending',
// textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
// letterSpacing: -0.56,
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              LinearProgressIndicator(
                value: progressValue,
                // show current balance - available balance

                minHeight: 7.0, // Set the height of the progress bar
                backgroundColor: Colors.black, // Set the background color
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                borderRadius: BorderRadius.all(
                    Radius.circular(20)), // Set the progress color
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getCurrentMonth() {
    // Get the current date
    DateTime now = DateTime.now();

    // Format the date to get the month name
    String formattedMonth = DateFormat('MMMM').format(now);

    return formattedMonth;
  }
}
