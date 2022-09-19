import 'dart:convert';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:safetfirst/quiz1.dart';

class Course_video extends StatefulWidget {
  const Course_video({Key? key}) : super(key: key);

  @override
  State<Course_video> createState() => _Course_videoState();
}

class _Course_videoState extends State<Course_video> {
  fetchCoursedetails() async {
    var url;
    url = await http.get(Uri.parse(
        "https://tossas.in/youngman/software/api/course-details/2"));
    // .get(Uri.parse("https://vrt.vahanacloud.com/router/engine/v1/"));
    return json.decode(url.body)['data'];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: fetchCoursedetails(),
            builder: (BuildContext context, AsyncSnapshot snapshot){

              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error as String),
                );
              }
              if (snapshot.hasData) {
                return
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child:
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: BetterPlayer.network(
                              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",

                              betterPlayerConfiguration: BetterPlayerConfiguration(
                                autoPlay: true,
                                aspectRatio: 16 / 9,
                              ),
                            ),
                          ),),
                        Container(
                          color: Colors.white,
                          height:  MediaQuery.of(context).size.height*0.10,
                          width: MediaQuery.of(context).size.width*0.95,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[

                                Text("Video 1/2"),
                                Spacer(flex: 1,),
                                Text(
                                  snapshot.data["course"]["name"].toString(),

                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),
                                ),
                                Spacer(flex: 1,),


                              ] ),
                        ),
                        Divider(color: Colors.black,thickness: 1.1,),


                        Container(
                          color: Colors.white,
                          height:  MediaQuery.of(context).size.height*0.15,
                          width: MediaQuery.of(context).size.width*0.95,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[

                                Text("Description",style: TextStyle(fontSize: 20,color: Colors.grey),),

                                Text(
                                  snapshot.data["course"]["description"].toString(),

                                  style: TextStyle(color: Colors.black,fontSize: 15),
                                ),



                              ] ),
                        ),


                        Divider(color: Colors.black,thickness: 1.1),
                        SizedBox(
                          height:MediaQuery.of(context).size.height*0.1 ,
                        ),
                        Container(
                          height:  MediaQuery.of(context).size.height*0.06,
                          width: MediaQuery.of(context).size.width*0.95,
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
                              Navigator.push(context, MaterialPageRoute(builder:(context)=>Formpage()));

                            },
                            child: Text(
                              'Test & Next',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),

                      ],
                    ),
                  );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }

        )
    );
  }
}
