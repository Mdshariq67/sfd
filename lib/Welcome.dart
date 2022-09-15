import 'package:flutter/material.dart';


import 'package:safetfirst/Logo.dart';
import 'package:safetfirst/SignUp.dart';
import 'package:safetfirst/deco.dart';
import 'package:safetfirst/login.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child:Logo(),
              ),
            ),
            Text("Welcome to SafetyFirst",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

            Text("Explore Us",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
            Container(
              height: 450,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("asset/welcome.jpg"),
                  fit: BoxFit.cover
                )
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


                    Navigator.push(context, MaterialPageRoute(builder:(context)=>LogIn()));

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
                'Sign Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
