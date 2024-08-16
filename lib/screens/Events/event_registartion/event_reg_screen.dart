import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h2o/constant/const.dart';
import 'package:h2o/screens/Events/booked_event_details_screen.dart';
import 'package:h2o/screens/Events/models/get_event_model_class.dart';
import 'package:h2o/screens/Events/service/booked_event_service.dart';
import 'package:h2o/screens/Events/widgets/CustomLabeledTextFormField.dart';
import 'package:h2o/screens/home_screen/home_screen.dart';
import 'package:h2o/widgets/custom_textfield.dart';
import 'package:intl/intl.dart';

class EventRegistrationScreen extends StatefulWidget {
  const EventRegistrationScreen({super.key});

  @override
  State<EventRegistrationScreen> createState() =>
      _EventRegistrationScreenState();
}

class _EventRegistrationScreenState extends State<EventRegistrationScreen> {
  final TextEditingController _eventTitle = TextEditingController();
  final TextEditingController _eventDetails = TextEditingController();
  final TextEditingController _mediaChoose = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();
  final TextEditingController _venue = TextEditingController();
  final TextEditingController _seatsController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: 180.0,
          width: double.infinity,
          child: CupertinoDatePicker(
            backgroundColor: Colors.white,
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            minimumDate: DateTime(1900),
            maximumDate: DateTime.now(),
            onDateTimeChanged: (DateTime newDate) {
              // Update the selectedDate or the controller's text as needed
              setState(() {
                selectedDate = newDate;
              });
            },
          ),
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      // Update your state or controller here
      setState(() {
        selectedDate = pickedDate;
      });
      // widget.onDateSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Event'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomLabeledTextFormField(
                  label: 'Event Title',
                  controller: _eventTitle,
                  fontFamily: primaryFont,
                  // Optionally override other parameters if needed
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomLabeledTextFormField(
                  label: 'Event Details',
                  controller: _eventTitle,
                  fontFamily: primaryFont,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal:
                          12.0), // Adjust the vertical padding to increase height
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Event Date",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'DefaultFont',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CupertinoTextField(
                  placeholder: 'Birthdate',
                  placeholderStyle: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                  ),
                  style: TextStyle(color: Colors.white),
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  prefix: IconButton(
                    icon: Icon(Icons.calendar_today,
                        color: Colors.black.withOpacity(0.7), size: 20),
                    onPressed: () => _selectDate(context),
                  ),
                  controller: TextEditingController(
                    text: selectedDate == null
                        ? ''
                        : "${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}",
                  ),
                ),
                CustomLabeledTextFormField(
                  label: 'Venue',
                  controller: _eventTitle,
                  fontFamily: primaryFont,
                  // Optionally override other parameters if needed
                ),
                SizedBox(
                  height: 20,
                ),
                CustomLabeledTextFormField(
                  label: 'Total Seats',
                  controller: _eventTitle,
                  fontFamily: primaryFont,
                  // Optionally override other parameters if needed
                ),
                SizedBox(
                  height: 20,
                ),
                CustomLabeledTextFormField(
                  label: 'Tickets Price',
                  controller: _priceController,
                  fontFamily: primaryFont,
                  // Optionally override other parameters if needed
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
