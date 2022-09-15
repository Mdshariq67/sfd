import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safetfirst/HomePage.dart';
import 'package:safetfirst/Logo.dart';
import 'package:http/http.dart' as http;

import 'package:safetfirst/SignUp.dart';
import 'package:safetfirst/deco.dart';
import 'package:safetfirst/forget_password.dart';
import 'package:safetfirst/otp.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  late String name,email,phone;
  bool _isLoading = false;

  //TextController to read text entered in text field
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Logo(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("LogIn",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.w200),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
              child: TextFormField(
                controller: _phone,
                keyboardType: TextInputType.number,
                decoration:buildInputDecoration(Icons.phone,"Phone No"),
                validator: (String ?value){
                  if(value!.isEmpty)
                  {
                    return 'Please enter phone no ';
                  }
                  return null;
                },

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
              child: TextFormField(
                controller: _password,
                keyboardType: TextInputType.text,
                decoration:buildInputDecoration(Icons.lock,"Password"),
                validator: (String? value){
                  if(value!.isEmpty)
                  {
                    return 'Please enter a Password';
                  }
                  return null;
                },

              ),
            ),
            FlatButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.green, fontSize: 15,),
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
                onPressed: (){

                  if(_formkey.currentState!.validate())
                  {
                    LoginUse();
                    print("successful");
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>HomePage()));
                    return;
                  }else{
                    print("UnSuccessfull");
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),

            FlatButton(
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
              },
              child: Text(
                'New User? Create Account',

              ),
            ),

          ],
        ),
        ),
      ),
    );
  }
  Future LoginUse() async{
    var APIURL=Uri.parse("https://tossas.in/youngman/software/api/login");
    Map mapeddata = {


      'mobile':_phone.text,
      'password':_password.text,

    };
    print("JSON DATA: ${mapeddata}");



    http.Response reponse = await http.post(APIURL,body: mapeddata);

    var data = jsonDecode(reponse.body);
    print("DATA: ${data}");

  }
}


