import 'package:flutter/material.dart';


import 'package:safetfirst/Logo.dart';
import 'package:safetfirst/SignUp.dart';
import 'package:safetfirst/deco.dart';
import 'package:safetfirst/otp.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late String name,email,phone;

  //TextController to read text entered in text field
  TextEditingController _phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
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
                child:Logo(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Password Forget",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w200),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Submit Your Mobile Number For Password Reset"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10,top: 15),
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
                    print("successful");
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Otp()));

                    return;
                  }else{
                    print("UnSuccessfull");
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),



          ],
        ),),
      ),
    );
  }
}
