import 'package:flutter/material.dart';
import 'package:govt_documents_validator/govt_documents_validator.dart';
import 'package:safetfirst/HomePage.dart';
import 'package:safetfirst/Logo.dart';
import 'package:safetfirst/SignUp.dart';
import 'package:safetfirst/login.dart';

class Uidai extends StatefulWidget {
  const Uidai({Key? key}) : super(key: key);

  @override
  State<Uidai> createState() => _UidaiState();
}

class _UidaiState extends State<Uidai> {
  final _formKey = GlobalKey<FormState>();
  late bool isAadharNum;

  AadharValidator aadharValidator = new AadharValidator();
  void _submit() {

    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Document Validation",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          elevation: 2.0,
        ),
        body:
      Padding(
        padding: const EdgeInsets.only(top: 20),
    child: Form(
    key: _formKey,
    child: Column(

    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Logo(),
        ),
      ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
      maxLength: 12,
      cursorColor: Colors.green,
      decoration: InputDecoration(
      labelText: 'Aadhar Number',

      border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(color: Colors.black),
      ),
      ),
      onFieldSubmitted: (value) {},
      validator: (value) {
      if (aadharValidator.validate(value!) == true) {
      return null;
      }
      return "Incorrect Aadhar Number";
      },
      ),
    ),
      Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,

              colors: [

                Color.fromRGBO(19,130,10,1),
                Color.fromRGBO(31,154,108,1),
              ],
            ), borderRadius: BorderRadius.circular(20)),
        child: FlatButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>LogIn()));
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Aaadhar Verified')),
              );
            }

          },





          child: Text(
            'Verify',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    ]))),

    //box styling
    );
  }

}
