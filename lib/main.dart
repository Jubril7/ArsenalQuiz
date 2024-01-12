import 'package:flutter/material.dart';
import 'package:quizzy/question.dart';

void main() {
  runApp( const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Arsenal Quizz',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 33, 33, 33),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreTracker = [];

  // List<String> questions = [
  //   'North London is red',
  //   'Arsenal won the 22/23 EPL',
  //   'Ben White is Arsenal\'s left back',
  //   'Is Saliba is RR?'
  // ];

  // List<bool> answers = [
  //   true,
  //   false,
  //   false,
  //   true
  // ];

  // Question q1 = Question(q: 'North London is red', a: true);

  List<Question> questionBank = [
    Question(q: 'North London is red', a: true),
    Question(q: 'Arsenal won the 22/23 EPL', a: false),
    Question(q: 'Ben White is Arsenal\'s left back', a: false),
    Question(q: 'Is Saliba is RR?', a: true),
  ];

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool isCorrectAnswer = questionBank[questionNumber].questionAnswer;

                if (isCorrectAnswer == true) {
                  print('you got it');
                } else {
                  print('you failed it');
                }

                setState(() {
                  questionNumber++;
                  scoreTracker.add(
                    const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool isCorrectAnswer = questionBank[questionNumber].questionAnswer;
                if (isCorrectAnswer == false) {
                  print('you got it');
                } else {
                  print('you failed it');
                }

                setState(() {
                  questionNumber++;
                  scoreTracker.add(
                    const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreTracker,
        )
      ],
    );
  }
}