import 'package:flutter/material.dart';
import 'package:safetfirst/Logo.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _dropDownValue = "Choose Your Gender";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Logo(),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text("Profile",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 35),),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: buildTextField("Name", "Enter Your Name",
                  TextInputType.name),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: buildTextField("Address Lane", "Enter Your Address ",
                  TextInputType.name),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: buildTextField("City", "Enter Your City",
                  TextInputType.name),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Gender",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: DropdownButton(
                dropdownColor: Colors.blueGrey,
                focusColor: Colors.blueAccent,
                hint: _dropDownValue == null
                    ? Text('Choose Your Gender')
                    : Text(
                  _dropDownValue,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
                isExpanded: true,
                iconSize: 30,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                items: ['Male', 'Female', 'Other'].map(
                      (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                        () {
                      _dropDownValue = val as String;
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 15),
              child: buildTextField("Email", "Enter Your Email",
                  TextInputType.name),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,),
              child: buildTextField("Mobile Number", "Enter Your Mobile Number",
                  TextInputType.number),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildTextField(String labelText, String placeholder, var type) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        keyboardType: type,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            )),
      ),
    );
  }
}
