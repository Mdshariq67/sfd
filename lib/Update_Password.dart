import 'package:flutter/material.dart';


import 'package:safetfirst/Logo.dart';
import 'package:safetfirst/deco.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({Key? key}) : super(key: key);

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  late String name,email,phone;

  //TextController to read text entered in text field
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
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
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Update Password",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w200),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30,left: 20,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Please Enter Your New Password"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                child: TextFormField(
                  controller: _password,
                  keyboardType: TextInputType.number,
                  decoration:buildInputDecoration(Icons.lock,"Enter New Password"),
                  validator: (String ?value){
                    if(value!.isEmpty)
                    {
                      return 'Please your new Password ';
                    }
                    return null;
                  },

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                child: TextFormField(
                  controller: _confirmpassword,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration:buildInputDecoration(Icons.lock,"Confirm Password"),
                  validator: (String ?value){
                    if(value!.isEmpty)
                    {
                      return "Please enter re-password";
                    }
                    if(_password.text != _confirmpassword.text)
                    {
                      return "Password Do not match";
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
