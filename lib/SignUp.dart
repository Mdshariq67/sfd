


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:safetfirst/Logo.dart';
import 'package:safetfirst/courses_list.dart';
import 'package:safetfirst/login.dart';
import 'package:safetfirst/otp.dart';
import 'package:safetfirst/deco.dart';
import 'package:safetfirst/verification.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);


  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String name,email,phone;

  //TextController to read text entered in text field
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();

  TextEditingController _aadhar = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:Form(
          key: _formkey,
          child:Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Center(
                  child: Logo(),
                ),
              ),


                Padding(
                  padding: const EdgeInsets.only(left: 15,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("SignUp",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.w200),),
                    ],
                  ),
                ),

              Padding(
                padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                child: TextFormField(
                  controller: _name,
                  keyboardType: TextInputType.text,
                  decoration: buildInputDecoration(Icons.person,"Name"),
                  validator: (String? value){
                    if(value!.isEmpty)
                    {
                      return 'Name';
                    }
                    return null;
                  },


                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                child: TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.text,
                  decoration:buildInputDecoration(Icons.email,"Email"),
                  validator: (String? value){
                    if(value!.isEmpty)
                    {
                      return 'Please Enter Email';
                    }
                    if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                      return 'Please a valid Email';
                    }
                    return null;
                  },


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
                      return 'Please a Enter Password';
                    }
                    return null;
                  },

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                child: TextFormField(
                  controller: _aadhar,
                  keyboardType: TextInputType.text,
                  decoration:buildInputDecoration(Icons.dock,"Aadhar"),
                  validator: (String? value){
                    if(value!.isEmpty)
                    {
                      return 'Please a Enter aadhar';
                    }
                    return null;
                  },

                ),
              ),
        // Padding(
        //   padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
        //   child:Uidai(),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
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

                        RegistrationUse();
                        print("successful");
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>Uidai()));


                        return;
                      }else{
                        print("UnSuccessfull");
                      }
                    },
                    child: Text(
                      'SignUp',
                      style: TextStyle(color: Colors.white, fontSize: 20,),
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>LogIn()));
                },
                child: Text(
                  'Already have an Account? Sign In',

                ),
              ),



            ],

          ),
        )
      ),
    )
    ;
  }

  Future RegistrationUse() async{
    var APIURL=Uri.parse("https://tossas.in/youngman/software/api/register");
    Map mapeddata = {
      'name':_name.text,
      'mobile':_phone.text,
      'email':_email.text,
      'password':_password.text,
      'aadhar':_aadhar.text,

    };

    print("JSON DATA: ${mapeddata}");
    http.Response reponse = await http.post(APIURL,body: mapeddata);



    var data = jsonDecode(reponse.body);

    print("Data: ${data}");

  }
}
