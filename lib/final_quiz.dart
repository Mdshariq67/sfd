import 'package:flutter/material.dart';
import 'package:quiz_view/quiz_view.dart';
import 'package:safetfirst/HomePage.dart';
import 'package:safetfirst/course_video.dart';
import 'package:safetfirst/course_video2.dart';

class FinalQuiz extends StatefulWidget {
  const FinalQuiz({Key? key}) : super(key: key);

  @override
  State<FinalQuiz> createState() => _FinalQuizState();
}

class _FinalQuizState extends State<FinalQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff504B4A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Test",style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic,color: Colors.blue.shade500),),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              quiz(context: context,quet: 'Question 1',que: "National Bird",ans: "Peacock",lans: ['Parrot']),
              Divider(height: 25,),
              quiz(context: context,que: "National Game",quet: "Question 2",ans: "Hockey",lans: ['cricket']),
              Divider(height: 25,),
              quiz(context: context,quet: 'Question 3',que: "National Animal",ans: "Tiger",lans: ['Lion']),
              Divider(height: 25,),
              // quiz(context: context,imgurl: "https://images.unsplash.com/photo-1598209279122-8541213a0387?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmMyMDB8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",quet: 'Question 1',que: "What is this bike ?",ans: "Rc200",lans: ['Duke200','Rx100']),
              // Divider(height: 25,),
              // quiz(context: context,imgurl: "https://images.unsplash.com/photo-1598209279122-8541213a0387?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmMyMDB8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",quet: 'Question 1',que: "What is this bike ?",ans: "Rc200",lans: ['Duke200','Rx100']),
              Divider(height: 25,),
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
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>HomePage()));


                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Divider(height: 25,),

            ],
          ),
        ),
      ),
    );
  }

  QuizView quiz({BuildContext? context,required String quet,required String que,required String ans,required List<String> lans}) {
    return QuizView(

      questionTag: quet,
      questionColor: Colors.redAccent.shade700,
      tagColor: Colors.black54,
      backgroundColor: Colors.white,
      tagBackgroundColor: Color(0xffF1CDC5),
      answerBackgroundColor: Color(0xffA39E9D),
      question: que,
      height: 250,
      width: 350,
      rightAnswer: ans,
      wrongAnswers: lans,
      onRightAnswer: (){
        showDialog(
            context: context!,
            builder: (BuildContext context){
              return AlertDialog(
                title: Text("Correct!"),
              );
            }
        );
      },
      onWrongAnswer: (){
        showDialog(
            context: context!,
            builder: (BuildContext context){
              return AlertDialog(
                title: Text("Wrong!"),
              );
            }
        );
      },
    );
  }
}
