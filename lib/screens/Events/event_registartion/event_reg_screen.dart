import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:h2o/constant/const.dart';
import 'package:h2o/screens/Events/booked_event_details_screen.dart';
import 'package:h2o/screens/Events/models/get_event_model_class.dart';
import 'package:h2o/screens/Events/service/booked_event_service.dart';
import 'package:h2o/screens/Events/widgets/CustomLabeledTextFormField.dart';
import 'package:h2o/screens/home_screen/home_screen.dart';
import 'package:h2o/widgets/custom_textfield.dart';
import 'package:image_picker/image_picker.dart';


import '../../../widgets/primary_button.dart';
import '../service/register_event_service.dart';

class EventRegistrationScreen extends StatefulWidget {
  const EventRegistrationScreen({super.key});

  @override
  State<EventRegistrationScreen> createState() =>
      _EventRegistrationScreenState();
}

class _EventRegistrationScreenState extends State<EventRegistrationScreen> {
  final TextEditingController _eventTitle = TextEditingController();
  final TextEditingController _eventDetails = TextEditingController();
  final TextEditingController _venue = TextEditingController();
  final TextEditingController _seatsController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  DateTime? selectedDate;
  Duration? selectedValue;
  File? _selectedImage;


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
  Duration? pickedTime;
  Future<void> showTimerPicker(BuildContext context) async {


     await showCupertinoModalPopup<Duration>(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,
          color: Colors.white,
          child: CupertinoTimerPicker(
            initialTimerDuration: const Duration(hours: 12, minutes: 0, seconds: 0),
            mode: CupertinoTimerPickerMode.hm,
            onTimerDurationChanged: (Duration value) {
              pickedTime = value;
            },
          ),
        );
      },
    );

    if (pickedTime != null) {
      print('Selected Time: $pickedTime');
      setState(() {
        selectedValue = pickedTime;
        print('Selected Time: $pickedTime');
        // Convert duration to hours and minutes format
        final hours = pickedTime!.inHours.toString().padLeft(2, '0');
        final minutes = (pickedTime!.inMinutes % 60).toString().padLeft(2, '0');
        _timeController.text = "$hours:$minutes";
      });
    }
  }


  Future<void> _pickImage() async {
    try {
      final imagePicker = ImagePicker();
      final XFile? imageFile = await imagePicker.pickImage(source: ImageSource.gallery);

      if (imageFile != null) {
        setState(() {
          _selectedImage = File(imageFile.path);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No image selected')),
        );
      }
    } catch (e) {
      // Handle any errors that occur during image picking
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
      print('Error: $e');
    }
  }



  final RegisterEventService _registerEventService = RegisterEventService();


  Future<void> _submitEvent() async {
    if (_selectedImage != null) {
      final newEvent = await _registerEventService.createEvent(
        title: _eventTitle.text,
        description: _eventDetails.text,
        image: _selectedImage!,
        date: selectedDate!,
        time: _timeController.text,
        venue: _venue.text,
        totalSeats: int.parse(_seatsController.text),
        ticketPrice: int.parse(_priceController.text),
      );
      if (newEvent != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Event created successfully')),
        );
        // Navigate to another screen or perform any other action
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Home(isAdmin: true,),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create event')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields and select an image')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title:const Text(
          "Create Event",
          style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
        
        backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,color: Colors.white,),
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
                  controller: _eventDetails,
                  fontFamily: primaryFont,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal:
                          12.0), // Adjust the vertical padding to increase height
                ),
                const SizedBox(
                  height: 20,
                ),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Upload Event Image",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'DefaultFont',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: _pickImage,
                      child: _selectedImage == null
                          ? Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.add_a_photo,
                          color: Colors.black45,
                          size: 50,
                        ),
                      )
                          : Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: FileImage(_selectedImage!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Event Date",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'DefaultFont',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CupertinoTextField(
                  placeholder: '12 / 12 / 2023',
                  placeholderStyle: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                  ),
                  style: const TextStyle(color: Colors.black),
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
                const SizedBox(
                  height: 20,
                ),

                CupertinoTextField(
                  placeholder: 'Time',
                  placeholderStyle: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                  ),
                  style: const TextStyle(color: Colors.black),
                  readOnly: true,
                  onTap: () => showTimerPicker(context),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  prefix: IconButton(
                    icon: Icon(Icons.lock_clock_outlined,
                        color: Colors.black.withOpacity(0.7), size: 20),
                    onPressed: () => showTimerPicker(context),
                  ),
                  controller: selectedValue == null
                      ? TextEditingController(text: '')
                      : TextEditingController(
                          text:
                              "${selectedValue!.inHours}:${selectedValue!.inMinutes % 60}",
                        ),
                ),


                CustomLabeledTextFormField(
                  label: 'Venue',
                  controller: _venue,
                  fontFamily: primaryFont,
                  // Optionally override other parameters if needed
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomLabeledTextFormField(
                  label: 'Total Seats',
                  controller: _seatsController,
                  fontFamily: primaryFont,
                  // Optionally override other parameters if needed
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomLabeledTextFormField(
                  label: 'Tickets Price',
                  controller: _priceController,
                  fontFamily: primaryFont,
                  // Optionally override other parameters if needed
                ),
                const SizedBox(
<<<<<<< HEAD
=======
                  height: 20,
                ),


                Center(
                  child: PrimaryButton(
                    text: 'Create Event',
                    color: Colors.black,
                    textColor: Colors.white,
                    onPressed: _submitEvent,
                  ),
                ),
                const SizedBox(
>>>>>>> upstream/event_reg
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
