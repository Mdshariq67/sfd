import 'package:flutter/material.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:safetfirst/HomePage.dart';
import 'package:safetfirst/Logo.dart';
import 'package:safetfirst/verification.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
        Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Center(
          child: Logo(),
        ),
      ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Enter OTP Send To Your Mobile Number",style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),

              OtpTextField(
                numberOfFields: 5,
                borderColor: Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      }
                  );
                }, // end onSubmit
              ),
              Container(
                margin: EdgeInsets.all(100),
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
                Navigator.push(context, MaterialPageRoute(builder:(context)=>HomePage()));
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ]))
    );
  }
}
