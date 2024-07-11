import 'package:flutter/material.dart';

import '../../../constant/const.dart';

class ShortTermGoalWidget extends StatelessWidget {
  var goal;

  var goalDescription;

  ShortTermGoalWidget(
      {super.key, required this.goal, required this.goalDescription});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.150,
      width: MediaQuery.of(context).size.width * 0.90,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, top: 20.0, right: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                goal,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: primaryFont,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: Text(
                  goalDescription,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: primaryFont,
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
