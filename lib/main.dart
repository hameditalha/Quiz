import 'dart:math';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Quiz());
}

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black54,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child:QuizFaces()
          ),
        ),
      ),
    );
  }
}

class QuizFaces extends StatefulWidget {
  @override
  _QuizFacesState createState() => _QuizFacesState();
}

class _QuizFacesState extends State<QuizFaces> {
  @override
  void endGame(){
    Alert(
      buttons: [
        DialogButton(
          color: Colors.black54,
          child: Text(
            "RESET",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: (){
            setState(() {
            result = [];
            });
            Navigator.pop(context);
          },
          width: 120,
        ),
        DialogButton(
          color: Colors.black54,
          child: Text(
            "CLOSE",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: (){
            setState(() {
            result = [];
            });
            SystemNavigator.pop();
          },
          width: 120,
        )
      ],
      context: context,
      style: AlertStyle(
        isCloseButton: false,
        isOverlayTapDismiss: false,
        backgroundColor: Colors.white60,
        overlayColor: Colors.black38),
      title: 'FINISH!',
      desc: 'TATA! BYE BYE!!!',  
    ).show();
  }

  void  checkAnswer(bool x){

    count++;
    if ((a+b>c) == x){
      result.add(Icon(Icons.check, color: Colors.green,));
    }
    else{
      result.add(Icon(Icons.clear, color: Colors.red,));
    }
    a = updateQuestion(50);
    b = updateQuestion(50);
    c = updateQuestion(60);
    if (count == 5){
      endGame();
      count = 0;
    }
  }

  int updateQuestion(x) => Random().nextInt(x);

  var a = Random().nextInt(50);
  var b = Random().nextInt(50);
  var c = Random().nextInt(100);
  
  int count = 0;
  
  List <Widget> result = [];
  
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                child: Text('$a + $b > $c',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
            ), 
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    checkAnswer(true);                  
                    });
                },
                child: Text('TRUE',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                  ),
                color: Colors.green,
                ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    checkAnswer(false);
                  });
                },
                child: Text('FALSE',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                  ),
                color: Colors.red,
                ),
            ),
          ),
        Row(
          children: result,
        )
        ],
      ),  
    );
  }
}