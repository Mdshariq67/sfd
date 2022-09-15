import 'package:flutter/material.dart';
import 'package:safetfirst/Drawer.dart';
import 'package:safetfirst/Logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer:  NavigationDrawerWidget(),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Center(
              child:Logo(),
            ),
          ),
      ],
        ),
      )
    );
  }
}
