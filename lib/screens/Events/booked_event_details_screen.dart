import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../home_screen/home_screen.dart';
import 'models/booked_event_model.dart';

class BookedEventDetailsScreen extends StatefulWidget {
  final Event event;
  const BookedEventDetailsScreen({super.key, required this.event});

  @override
  State<BookedEventDetailsScreen> createState() => _BookedEventDetailsScreenState();
}

class _BookedEventDetailsScreenState extends State<BookedEventDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    String isoDate = widget.event.date.toString();
    DateTime date = DateTime.parse(isoDate);
    DateFormat formatter = DateFormat('MM-dd-yyyy');
    String formattedDate = formatter.format(date);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Event Details'),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            Navigator.of(context).
            pushReplacement(
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
          },
        ),
      ),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 130,
              ),
              Image.network(widget.event.images.isEmpty
                  ? 'https://res.cloudinary.com/dx3kgoad5/image/upload/v1707300650/images/1707300647385.webp'
                  : widget.event.images[0].toString()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(widget.event.title,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width -
                                  40, // Subtract padding/margins as needed
                            ),
                            child: Text(
                              widget.event.description,
                              style: const TextStyle(fontSize: 18),
                              softWrap: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.event,
                          size: 25,
                          color: Colors.black,
                        ),
                        const Text(
                          'Date: ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          formattedDate,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.timelapse_rounded,
                          size: 25,
                          color: Colors.black,
                        ),
                        const Text(
                          'Time: ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.event.time,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 25,
                          color: Colors.black,
                        ),
                        Text(
                          'Venue: ',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.event.venue,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.attach_money,
                          size: 25,
                          color: Colors.black,
                        ),
                        Text(
                          'Price: ',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$${widget.event.ticketPrice.toString()}",
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.event_seat,
                          size: 25,
                          color: Colors.black,
                        ),
                        Text(
                          'Total Seats: ',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.event.totalSeats.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.event_seat,
                          size: 25,
                          color: Colors.black,
                        ),
                        Text(
                          'Available Seats: ',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.event.availableSeats.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () async {
                          showCupertinoDialog(
                            context: context,
                            builder: (context) => CupertinoAlertDialog(
                              title: Text("Event Booked"),
                              content: Text("You have successfully booked this event."),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text(
                          'Event Booked',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
