import 'package:flutter/material.dart';

import 'question.dart';

class QuizBrain {

  BuildContext context;
  QuizBrain(this.context);


  int  _questionNumber = 0;

  final List<Question> _questionBank = [
    Question('North London is red', true),
    Question('Arsenal won the 22/23 EPL', false),
    Question('Ben White is Arsenal\'s left back', false),
    Question('Is Saliba is RR?', true),
  ];


  void nextQuestionNumber() {
    if(_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    } else {
      _showEndDialog();
    }
  }

  String getQuestion() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  void _showEndDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('End of Quiz'),
          content: const Text('Congratulations! You have completed the quiz.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}