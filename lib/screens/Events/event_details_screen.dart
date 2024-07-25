import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:h2o/screens/Events/service/buy_ticket_service.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_screen/home_screen.dart';
import 'book_ticket/book_ticket_screen.dart';
import 'models/get_event_model_class.dart';
import 'package:http/http.dart' as http;

class EventDetailsScreen extends StatefulWidget {
  Event event;
  EventDetailsScreen({super.key, required this.event});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  Map<String, dynamic>? paymentIntent;

  void makePayment(BuildContext context) async {
    try {
      log('Inside make payment');
      paymentIntent = await _createTestPaymentSheet();
      log('Payment Intent created: $paymentIntent');

      var gpay = const PaymentSheetGooglePay(
        merchantCountryCode: "US",
        currencyCode: "usd",
        testEnv: true,
      );

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          googlePay: gpay,
          style: ThemeMode.dark,
          merchantDisplayName: 'Flutter Stripe Store',
        ),
      );

      // Call displayPaymentSheet after initializing the payment sheet
      displayPaymentSheet(context);
    } catch (e) {
      print("Make Payment: $e");
    }
  }

  void displayPaymentSheet(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('userToken');

    try {
      await Stripe.instance.presentPaymentSheet();

      final apiService = BuyTicketService(
        userToken: userToken!,
      );

      try {
        final ticketResponse = await apiService.purchaseTicket(widget.event.id);
        print('Ticket Buy and event added Message: ${ticketResponse.message}');
        print('Ticket ID: ${ticketResponse.ticket.id}');
      } catch (e) {
        print('Ticket Buy and event added Message: $e');
      }

      // Navigate to the next screen after payment is successful
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BookTicketScreen(),
        ),
      );
    } catch (e) {
      print("Display Payment: $e");
    }
  }

  _createTestPaymentSheet() async {
    // 1. Create a PaymentIntent on the server
    final url = Uri.parse('https://api.stripe.com/v1/payment_intents');

    try {
      Map<String, dynamic> body = {
        'amount': '1099',
        'currency': 'USD',
        // 'payment_method_types[]': 'card',
        // 'capture_method': 'manual',
      };

      http.Response response = await http.post(
        url,
        body: body,
        headers: {
          "Authorization":
              "Bearer sk_test_51Oda4PHSvDuMR6pwUOCQMIQesEmc3NoE70rrl9S7vansXpxz3FBUzgshEsUrDJTFJMAQaLM4vZAPWvjduXOoDI0J00vpd4Tp7N",
          "Content-Type": "application/x-www-form-urlencoded",
        },
      );

      print("Create Payment: $response");

      return json.decode(response.body);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    String isoDate = widget.event.date.toString();
    DateTime date = DateTime.parse(isoDate);

    // Set up the format you want
    DateFormat formatter = DateFormat('MM-dd-yyyy'); // Example: 2024-02-22
    String formattedDate = formatter.format(date);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Image.network(widget.event.images.isEmpty
                  ? 'https://res.cloudinary.com/dx3kgoad5/image/upload/v1707300650/images/1707300647385.webp'
                  : widget.event.images[0].toString()),
              const SizedBox(height: 10),
              Text(
                widget.event.title,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 16,
                ),
                child: Text(
                  widget.event.description,
                  style: const TextStyle(fontSize: 18),
                  softWrap: true,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.event, size: 25, color: Colors.black),
                  const SizedBox(width: 5),
                  const Text(
                    'Date: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    formattedDate,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.timelapse_rounded,
                      size: 25, color: Colors.black),
                  const SizedBox(width: 5),
                  const Text(
                    'Time: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.event.time,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 25, color: Colors.black),
                  const SizedBox(width: 5),
                  const Text(
                    'Venue: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.event.venue,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.attach_money, size: 25, color: Colors.black),
                  const SizedBox(width: 5),
                  const Text(
                    'Price: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$${widget.event.ticketPrice.toString()}",
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.event_seat, size: 25, color: Colors.black),
                  const SizedBox(width: 5),
                  const Text(
                    'Total Seats: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.event.totalSeats.toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.event_seat, size: 25, color: Colors.black),
                  const SizedBox(width: 5),
                  const Text(
                    'Available Seats: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.event.availableSeats.toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () async {
                    makePayment(context);
                  },
                  child: const Text(
                    'Book Ticket',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookTicketBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('assets/logo/logo.png'),
            SizedBox(height: 16),
            Text(
              'Book Ticket',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}





















// import 'dart:convert';
// import 'dart:developer';
// import 'dart:ui';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:h2o/screens/Events/service/buy_ticket_service.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../home_screen/home_screen.dart';
// import 'book_ticket/book_ticket_screen.dart';
// import 'models/get_event_model_class.dart';
// import 'package:http/http.dart' as http;

// class EventDetailsScreen extends StatefulWidget {
//   Event event;
//    EventDetailsScreen({super.key, required this.event});

//   @override
//   State<EventDetailsScreen> createState() => _EventDetailsScreenState();
// }

// class _EventDetailsScreenState extends State<EventDetailsScreen> {

//   Map<String, dynamic>? paymentIntent;

//   void makePayment(BuildContext context) async {
//     try {
//       log('Inside make payment');
//       paymentIntent = await _createTestPaymentSheet();
//       log('Payment Intent created: $paymentIntent');

//       var gpay = const PaymentSheetGooglePay(
//         merchantCountryCode: "US",
//         currencyCode: "usd",
//         testEnv: true,
//       );

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           googlePay: gpay,
//           style: ThemeMode.dark,
//           merchantDisplayName: 'Flutter Stripe Store',
//         ),
//       );

//       // Call displayPaymentSheet after initializing the payment sheet
//       displayPaymentSheet(context);

//     } catch (e) {
//       print("Make Payment: $e");
//     }
//   }

//   void displayPaymentSheet(BuildContext context) async {

//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userToken = prefs.getString('userToken');

//     try {
//       await Stripe.instance.presentPaymentSheet();

//       final apiService = BuyTicketService(
//         userToken: userToken!,
//       );

//       try {
//         final ticketResponse = await apiService.purchaseTicket(widget.event.id);
//         print('Ticket Buy and event added Message: ${ticketResponse.message}');
//         print('Ticket ID: ${ticketResponse.ticket.id}');
//       } catch (e) {
//         print('Ticket Buy and event added Message: $e');

//       }

//       // Navigate to the next screen after payment is successful
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => BookTicketScreen(),
//         ),
//       );
//     } catch (e) {
//       print("Display Payment: $e");
//     }
//   }

//   _createTestPaymentSheet() async {
//     // 1. Create a PaymentIntent on the server
//     final url = Uri.parse('https://api.stripe.com/v1/payment_intents');

//     try {
//       Map<String, dynamic> body = {
//         'amount': '1099',
//         'currency': 'USD',
//         // 'payment_method_types[]': 'card',
//         // 'capture_method': 'manual',
//       };

//       http.Response response = await http.post(
//           url,
//           body: body,
//           headers: {

//             "Authorization": "Bearer sk_test_51Oda4PHSvDuMR6pwUOCQMIQesEmc3NoE70rrl9S7vansXpxz3FBUzgshEsUrDJTFJMAQaLM4vZAPWvjduXOoDI0J00vpd4Tp7N",
//             "Content-Type": "application/x-www-form-urlencoded",
//           });

//       print("Create Payment: $response");

//       return json.decode(response.body);
//     }catch(e){
//       print(e);
//     }
//   }
//   @override
//   Widget build(BuildContext context) {

//     String isoDate =  widget.event.date.toString();
//     DateTime date = DateTime.parse(isoDate);

//     // Set up the format you want
//     DateFormat formatter = DateFormat('MM-dd-yyyy');  // Example: 2024-02-22
//     String formattedDate = formatter.format(date);
//     return CupertinoPageScaffold(
//       // add navigation back button
//         navigationBar: CupertinoNavigationBar(
//           middle: Text('Event Details'),
//           leading: CupertinoNavigationBarBackButton(
//             onPressed: () {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(
//                   builder: (context) => const Home(),
//                 ),
//               );
//             },
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Container(
//             // elevation: 0,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
          
//                 SizedBox(
//                   height: 130,
          
//                 ),
//                 Image.network(widget.event.images.isEmpty ? 'https://res.cloudinary.com/dx3kgoad5/image/upload/v1707300650/images/1707300647385.webp' :widget.event.images[0].toString()),
          
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
          
//                           Text(widget.event.title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
//                         ],
//                       ),

//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 5.0, right: 5.0),
//                             child: ConstrainedBox(
//                               constraints: BoxConstraints(
//                                 maxWidth: MediaQuery.of(context).size.width - 40,  // Subtract padding/margins as needed
//                               ),
//                               child: Text(
//                                 widget.event.description,
//                                 style: const TextStyle(fontSize: 18),
//                                 softWrap: true,
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
// ,
//                       const SizedBox(
//                         height: 20,
//                       ),


//                       Row(
//                         children: [
//                           const Icon(Icons.event, size: 25, color: Colors.black,),
//                           const Text('Date: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
//                           Text(formattedDate, style: const TextStyle(fontSize: 18, ),)
//                         ],
//                       ),
          
//                       const SizedBox(
//                         height: 10,
//                       ),
          
//                       Row(
//                         children: [
//                           const Icon(Icons.timelapse_rounded, size: 25, color: Colors.black,),
//                           const Text('Time: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
//                           Text(widget.event.time, style: const TextStyle(fontSize: 18, ),)
//                         ],
//                       ),
          
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           const Icon(Icons.location_on, size: 25, color: Colors.black,),
//                           Text('Venue: ', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
//                           Text(widget.event.venue, style: const TextStyle(fontSize: 18, ),)
//                         ],
//                       ),


          
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           const Icon(Icons.attach_money, size: 25, color: Colors.black,),
//                           Text('Price: ', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
//                           Text("\$${widget.event.ticketPrice.toString()}", style: const TextStyle(fontSize: 18, ),)
//                         ],
//                       ),
          
          
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           const Icon(Icons.event_seat, size: 25, color: Colors.black,),
//                           Text('Total Seats: ', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
//                           Text(widget.event.totalSeats.toString(), style: const TextStyle(fontSize: 18, ),)
//                         ],
//                       ),
          
//                       SizedBox(
//                         height: 10,
//                       ),
          
//                       Row(
//                         children: [
//                           const Icon(Icons.event_seat, size: 25, color: Colors.black,),
//                           Text('Available Seats: ', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
//                           Text(widget.event.availableSeats.toString(), style: const TextStyle(fontSize: 18, ),)
//                         ],
//                       ),
          
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.black,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                           ),
//                           onPressed: () async => {

//                             makePayment(context),
//                           },
//                           child: const Text('Book Ticket', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),),
//                         ),
//                       )
          
//                     ],
//                   ),
          
          
//                 ),
          
          
//               ],
//             ),
//           ),
//         )

//     );
//   }
// }




// class BookTicketBottomSheet extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoActionSheet(
//       title: Text('Book Ticket'),
//       message: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Image.asset('assets/logo/logo.png'),
//           SizedBox(height: 16),
//           Text(
//             'Book Ticket',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//       actions: <CupertinoActionSheetAction>[
//         CupertinoActionSheetAction(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Close'),
//         ),
//       ],
//     );
//   }
// }


