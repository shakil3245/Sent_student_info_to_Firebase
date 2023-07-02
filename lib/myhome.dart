import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _cgpaController = TextEditingController();

sendStudentInfoToDB() async{
  CollectionReference _colectionRef = FirebaseFirestore.instance.collection('Student-Info');
  return _colectionRef.doc().set({
    'name':_nameController.text,
    "age":_ageController.text,
    'phone':_phoneController.text,
    "subject": _subjectController.text,
    'cgpa':_cgpaController.text,

  }).then((value) => Fluttertoast.showToast(msg: "User Added"))
      .catchError((error) =>Fluttertoast.showToast(msg: "Failed to add user: $error"));

}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 30),
              child: Text("Student Info",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 30,),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Enter your Name",
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                hintText: "Enter your Age",
                labelText: "Age",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                hintText: "Enter your Phone",
                labelText: "Phone",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: _subjectController,
              decoration: InputDecoration(
                hintText: "Enter your Subject:",
                labelText: "Subject",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: _cgpaController,
              decoration: InputDecoration(
                hintText: "Enter your CGPA:",
                labelText: "CGPA",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15,),
            SizedBox(
              height: 50,
            width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  sendStudentInfoToDB();
                  Fluttertoast.showToast(msg: "Successfull");

                },
                child: Text("Submit"),
              ),
            )


          ],
        ),
      ),
    );
  }
}

