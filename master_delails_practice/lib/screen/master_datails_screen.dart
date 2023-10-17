import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:master_delails_practice/person_class.dart';

class MasterDetails extends StatelessWidget {
  
  final Person personDetails;
  MasterDetails({required this.personDetails});

  getpermission()async{
    PhoneContact _phonecontact;
   await FlutterContactPicker.requestPermission();
      if(await FlutterContactPicker.hasPermission()){
        _phonecontact = await FlutterContactPicker.pickPhoneContact();
        if (_phonecontact!= true){
          if(_phonecontact.fullName!.isNotEmpty){
            return _phonecontact.fullName.toString();
          }
        }
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                margin: EdgeInsets.only(left: 40,right: 40,top: 30),
                child: Image.asset("assets/${personDetails.image}",fit: BoxFit.cover,),
              ), SizedBox(height: 20,),

              Text("Name: ${personDetails.name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),),
              Text("Designation : ${personDetails.designation}"),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.mail),
                  Text("email address : ${personDetails.email}"),
                ],
              ),

              InkWell(
                onTap: (){
                  getpermission();
                },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.call),
                      Text("Contact : ${personDetails.phoneNo}"),
                    ],
                  )),


              SizedBox(height: 30,),
              Text("Story: ${personDetails.name}' - This is the full name of the individual, and it appears to be ""John Doe."
              "Designation: 'Software Engineer' - This indicates John Doe's job title or role, which is ""Software Engineer." "It suggests that he works in software development."
             " Email: 'john.doe@example.com' - This is the email address associated with John Doe, which is 'john.doe@example.com'"
              "Phone Number: '017456-7890' - This is John Doe's contact phone number, which is '017456-7890'"
                  "Overall, this information could be used in various contexts, such as a personal or professional profile, contact information, or within an application to display information about John Doe, including his image, name, job title, email, and phone number.")

            ],
          ),
        ),
      )
    );
  }
}
