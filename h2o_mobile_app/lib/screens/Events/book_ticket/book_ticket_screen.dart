import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookTicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Event Ticket'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
          Image.asset('assets/logo/logo.png'),
            const SizedBox(height: 20),
            const Text(
              'Ticket Booked Successfully',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

          ],
        )
      ),
    );
  }
}

