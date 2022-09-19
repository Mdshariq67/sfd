import 'dart:convert';
import 'package:better_player/better_player.dart';
import 'package:safetfirst/course_video.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Course_details extends StatefulWidget {
  const Course_details({Key? key}) : super(key: key);

  @override
  State<Course_details> createState() => _Course_detailsState();
}

class _Course_detailsState extends State<Course_details> {
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

                Text("Demo Video"),
                  Spacer(flex: 1,),
                  Text(
                snapshot.data["course"]["name"].toString(),

                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),
                  ),
                  Spacer(flex: 1,),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Row(
                      children: [
                        Text("₹",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 20),),
                        Text(
                          snapshot.data["course"]["cost"].toString(),

                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 20),
                        ),
                      ],
                    ),
                  ),

               ] ),
            ),
            Divider(color: Colors.black,thickness: 1.1,),
            Container(
              color: Colors.white,
              height:  MediaQuery.of(context).size.height*0.04,
              width: MediaQuery.of(context).size.width*0.95,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width:70,
                      height:58,

                      decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,

                colors: [

                    Color.fromRGBO(19,130,10,1),
                    Color.fromRGBO(31,154,108,1),
                ],
                    ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(child: Text("4.5",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Very Good",style: TextStyle(fontSize: 25),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:45),
                    child: Text("49 Reviews",style: TextStyle(fontSize: 20,color: Colors.green),),
                  ),

                ],

              ),
            ),
            Divider(color: Colors.black,thickness: 1.1),

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
            Container(
              color: Colors.white,
              height:  MediaQuery.of(context).size.height*0.06,
              width: MediaQuery.of(context).size.width*0.95,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Course Module",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                ),
              ],
            ),
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
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>Course_video()));

                },
                child: Text(
                  'Buy Now',
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
