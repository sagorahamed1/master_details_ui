import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_delails_practice/person_class.dart';
import 'package:master_delails_practice/screen/master_datails_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //make person information
  List <Person> getpersonsinfo(){
    List <Person> list = [];
    list.add(Person(image: 'person1.jpg', name: 'John Doe', designation: 'Software Engineer', email: 'john.doe@example.com', phoneNo: '017456-7890',));
    list.add(Person(image: 'person2.jpg', name: 'Jane Smith', designation: 'Product Manager', email: 'jane.smith@example.com', phoneNo: '014567-8901',));
    list.add(Person(image: 'person3.jpg', name: 'David Johnson', designation: 'Graphic Designer', email: 'david.johnson@example.com', phoneNo: '013678-9012',));
    list.add(Person(image: 'person4.jpg', name: 'Emily Brown', designation: 'Marketing Specialist', email: 'emily.brown@example.com', phoneNo: '016789-0123',));
    list.add(Person(image: 'person5.jpg', name: 'Michael Wilson', designation: 'Financial Analyst', email: 'michael.wilson@example.com', phoneNo: '019890-1234',));
    list.add(Person(image: 'person6.jpg', name: 'Sarah Davis', designation: 'HR Manager', email: 'sarah.davis@example.com', phoneNo: '015901-2345',));
    list.add(Person(image: 'person7.jpg', name: 'Robert Lee', designation: 'Sales Representative', email: 'robert.lee@example.com', phoneNo: '015012-3456',));
    list.add(Person(image: 'person8.jpg', name: 'Linda Harris', designation: 'Customer Support', email: 'linda.harris@example.com', phoneNo: '018123-4567',));
    list.add(Person(image: 'person9.jpg', name: 'William Clark', designation: 'Architect', email: 'william.clark@example.com', phoneNo: '016234-5678',));
    list.add(Person(image: 'person10.jpg', name: 'Karen Turner', designation: 'Data Analyst', email: 'karen.turner@example.com', phoneNo: '014345-6789',));
    list.add(Person(image: 'person11.jpg', name: 'James Baker', designation: 'Consultant', email: 'james.baker@example.com', phoneNo: '014456-7890',));
    list.add(Person(image: 'person12.jpg', name: 'Amanda White', designation: 'Researcher', email: 'amanda.white@example.com', phoneNo: '013567-8901',));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    //person information list
    var personlist = getpersonsinfo();

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: CupertinoColors.white,
        centerTitle: true,
        leading: Icon(Icons.menu,color: CupertinoColors.black,size: 30,),
        title: Text("Employee", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800 ,color: CupertinoColors.black),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.red,size: 35,))
        ],
      ),

      body: ListView.builder(
          itemCount: personlist.length,
          itemBuilder: (context, index) {
            return Container(
              height: 140,
              padding: EdgeInsets.all(7),
              child: SafeArea(
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (cxt)=> MasterDetails(personDetails: personlist[index])));
                  },
                  child: Card(
                    elevation: 2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Container(
                          padding: EdgeInsets.only(left: 6,top: 15,bottom: 5),
                          height: 100,
                          width: MediaQuery.of(context).size.width/2.5,
                          child: Image.asset("assets/${personlist[index].image}"),
                        ),

                          //person information
                          Container(
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.only(right: 3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${personlist[index].name}", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                                Text("${personlist[index].designation}"),
                                Text("${personlist[index].email}"),
                                Text("${personlist[index].phoneNo}"),
                              ],
                            ),
                          )
                      ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },),
    );
  }
}
