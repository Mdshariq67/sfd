import 'package:flutter/material.dart';
import 'package:safetfirst/Course_details.dart';
import 'package:safetfirst/HomePage.dart';
import 'package:safetfirst/Quiz_Screen.dart';
import 'package:safetfirst/SignUp.dart';
import 'package:safetfirst/Update_Password.dart';
import 'package:safetfirst/Video_Player.dart';
import 'package:safetfirst/Welcome.dart';
import 'package:safetfirst/courses_list.dart';
import 'package:safetfirst/forget_password.dart';




import 'package:safetfirst/login.dart';
import 'package:safetfirst/otp.dart';
import 'package:safetfirst/profile.dart';
import 'package:safetfirst/quiz1.dart';
import 'package:safetfirst/select_user.dart';
import 'package:safetfirst/user.dart';
import 'package:safetfirst/verification.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:Select_User(),
      debugShowCheckedModeBanner: false,
    );
  }
}

