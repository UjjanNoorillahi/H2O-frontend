import 'package:flutter/material.dart';
import 'package:h2o/screens/login_screen.dart';
import 'package:h2o/screens/sign_up_screen.dart';
import 'package:h2o/widgets/custom_textfield.dart';
import 'package:h2o/widgets/primary_button.dart';
class ChooseGender extends StatefulWidget {
  const ChooseGender({super.key});

  @override
  State<ChooseGender> createState() => _ChooseGenderState();
}

class _ChooseGenderState extends State<ChooseGender> {
  DateTime? selectedDate;


  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _anotherGenderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(child: Icon(Icons.arrow_back_ios), onTap: (){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => SignUpScreen(),
            ),
          );
        },),
      ),
      body: Center(

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // SizedBox(height: ,),


              // const Text("I am a",style: TextStyle(
              //     fontFamily: 'Adamina',
              //     fontSize: 24,
              //     fontWeight: FontWeight.w400
              // ),),
              const SizedBox(height: 18),


              Column(
                children: [
                  SizedBox(height: 16,),


                ],
              ),
          Container(
            width: 295,
            height: 56,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),

                ),
              ),
              child: const Text(
                "Woman",
                style: TextStyle(color: Colors.black, fontSize: 24, fontFamily: 'Adamina',
                    fontWeight: FontWeight.w400),
              ),

            ),
          ),

              SizedBox(height: 20,),
              Container(
                width: 295,
                height: 56,
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),

                    ),
                  ),
                  child: const Text(
                    "Man",
                    style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Adamina',
                        fontWeight: FontWeight.w400),
                  ),

                ),
              ),
              SizedBox(height: 20,),

               Padding(
                 padding: const EdgeInsets.only(left: 34, right: 34),
                 child: CustomTextField(labelText: 'Another', controller: _anotherGenderController,



                  ),
               ),

            ],
          ),
        ),
      ),
    );
  }


}
