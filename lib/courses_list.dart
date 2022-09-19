import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:http/http.dart' as http;
import 'package:safetfirst/Course_details.dart';
import 'package:safetfirst/Quiz_Screen.dart';

class Course_list extends StatefulWidget {
  @override
  State<Course_list> createState() => _Course_listState();
}

class _Course_listState extends State<Course_list> {
  fetchCourse() async {
    var url;
    url = await http.get(Uri.parse(
        "https://tossas.in/youngman/software/api/courses-list"));
    // .get(Uri.parse("https://vrt.vahanacloud.com/router/engine/v1/"));
    return json.decode(url.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Our Courses',
          style: TextStyle(fontSize: 25.0, color: Colors.black),
        ),
        elevation: 4,
        backgroundColor: Color.fromARGB(0, 0, 0, 0),

      ),
      body: FutureBuilder(
          future: fetchCourse(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error as String),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [

                      Expanded(
                        child: Card(
                          color: Colors.white38,
                          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                          child: Row(
                            children:[
                            Padding(
                              padding: const EdgeInsets.all(8.0),


                                child: Container(
                                  height:  MediaQuery.of(context).size.height*0.08,
                                width: MediaQuery.of(context).size.width*0.5,
                                  child:Column

                                    (crossAxisAlignment: CrossAxisAlignment.start,
                                      children:[ Text(

                                        snapshot.data[index]["name"],
                                        style: TextStyle(color: Colors.black),
                                      ),

                                        Container(
                                          height:  MediaQuery.of(context).size.height*0.04,
                                          width: MediaQuery.of(context).size.width*0.5,
                                          child: ReadMoreText(
                                            snapshot.data[index]["description"],
                                            trimLines: 2,

                                            preDataTextStyle: TextStyle(fontWeight: FontWeight.w500),

                                            colorClickableText: Colors.green,
                                            trimMode: TrimMode.Line,
                                            trimCollapsedText: '...Read more',
                                            trimExpandedText: ' read less',

                                            style: TextStyle(color: Color(0xff868597)),
                                          ),
                                        ),
                                      ]
                                  )
                          ),

                            ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.14,
                              ),
                              Center(
                                child: Container(


                                  width: MediaQuery.of(context).size.width*0.25,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8,top: 8),
                                        child:

                                        Padding(
                                          padding: const EdgeInsets.only(left: 19.0),
                                          child: Row(
                                            children: [
                                              Text("₹",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 20),),
                                              Text(

                                                snapshot.data[index]["cost"].toString(),
                                                style: TextStyle(color: Color(0xff868597)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.bottomLeft,
                                                end: Alignment.topRight,

                                                colors: [

                                                  Color.fromRGBO(64,224,208,100),
                                                  Color.fromRGBO(0,100,0,100),
                                                ],
                                              ), borderRadius: BorderRadius.circular(20)),
                                          child: FlatButton(onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder:(context)=>Course_details()));
                                          }, child: Text("Buy",style: TextStyle(color: Colors.white),),),)
                                    ],
                                  ),
                                ),
                              ),
                           ],







                            ),





                        ),
                      ),
                    ],
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}