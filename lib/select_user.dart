import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:safetfirst/Logo.dart';


import 'package:safetfirst/Welcome.dart';
import 'package:safetfirst/final_quiz.dart';
import 'package:visible_opacity/visible_opacity.dart';

 

class Select_User extends StatefulWidget {
  const Select_User({Key? key}) : super(key: key);

  @override
  State<Select_User> createState() => _Select_UserState();
}

class _Select_UserState extends State<Select_User> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(extendBodyBehindAppBar: true,


      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
    body: Column(


      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10,top: 90,right: 30),
          child: Container(
            height: 200,
            width: 200,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
                image: DecorationImage(
                    image: AssetImage('asset/profile.png'),
                  fit: BoxFit.none


                )
            ),
          ),
        ),
        SizedBox(height: 90,),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Welcome()));



              },
              child: Text(
                'For Individual User',
                style: TextStyle(color: Colors.white, fontSize: 20,),
              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FinalQuiz()));



              },
              child: Text(
                'For Corporate User',
                style: TextStyle(color: Colors.white, fontSize: 20,),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 120.0),
          child: Center(
            child: Logo(),
          ),
        ),
      ],
    ),
    );
  }
}
