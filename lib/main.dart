
import 'package:flutter/material.dart';
import 'package:new_folder/result.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const[
  {
  'questionText' : 'What is your Favourite Color?',
  'answers' : [{'text':'Black','score':10},
  {'text':'Red','score':5},
    {'text':'Green','score':3},
    {'text':'White','score':1},
  ],
},
{'questionText': 'What is your favourite animal?',
'answers': [{'text':'Tiger','score':10},
  {'text':'Lion','score':5},
  {'text':'Leopard','score':3},
  {'text':'Zebra','score':1},
],
},
{'questionText': 'What is your favourite city?',
'answers': [{'text':'Bhopal','score':1},
{'text':'Delhi','score':1},
{'text':'Mumbai','score':1},
{'text':'Kolkata','score':1},
],
},
];
  var _questionIndex = 0;
  var _totalScore=0;

  void _resetQuiz(){
    if (_questionIndex!=0 && _totalScore!=0) {
      setState(() {
       _questionIndex=0;
        _totalScore=0;
      });
    }
   }

  void _answerQuestion(int score) {
    _totalScore= _totalScore+score;
   if (_questionIndex!=0){
   setState(() {
     _questionIndex = _questionIndex + 1;
   },);
   }
    print(_questionIndex);
    if (_questionIndex< _questions.length){
      print('We have more questions!');
    }
    else{
      print('No more questions :)');
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body:_questionIndex< _questions.length ?Quiz(answerQuestion: _answerQuestion,
            questionIndex:_questionIndex,
            questions:  _questions)
            :Result(_totalScore,_resetQuiz),
      ),
    );
  }
}




