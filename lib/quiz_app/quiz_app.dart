import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_quiz_app_flutter/quiz_app/question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name(
        "In 1963 boundary agreement was signed between Pakistan and china",
        true),
    Question.name(
        "In 1963 boundary agreement was signed between Pakistan and India",
        true),
    Question.name("Asia is spread up to 44.3 million square kilometers", true),
    Question.name(
        "The objective resolution has the fundamental importance in the history of Pakistan",
        true),
    Question.name(
        "The permanent constitution was given by Muhammad Ali Jinnah", false),
    Question.name("India occupied Kashmir by agreement", false),
    Question.name(
        "The second highest peak of the world and highest peak of Pakistan is Karakoram Range",
        false),
    Question.name(
        "The military regimes was started in Pakistan history from 1958 October 7",
        true),
    Question.name("Bhutto becomes the prime minister in 1973", true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Quiz Application"),
        centerTitle: true,
      ),
      body: Builder(
        builder: (BuildContext context) => Container(
          color: Colors.blueGrey,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Center(
                child: Image.asset(
                  "images/1.1 flag.png",
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 4.0),
                        child: Text(
                          questionBank[_currentQuestionIndex].questionText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey.shade900,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        onPressed: () => _previousQuestion(),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey.shade900,
                        ),
                        child: Text(
                          "TRUE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                        onPressed: () => _checkAnswer(true, context),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey.shade900,
                        ),
                        child: Text(
                          "FALSE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                        onPressed: () => _checkAnswer(false, context),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey.shade900,
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        onPressed: () => _nextQuestion(),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final snackBar = SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text("Yes Correct!"),
      );
      Scaffold.of(context).showSnackBar(snackBar);
      _updateQuestion();
    }
    else
      {
        final snackBar = SnackBar(
          duration: Duration(milliseconds: 500),
          content: Text("Incorrect!"),
        );
        Scaffold.of(context).showSnackBar(snackBar);
        _updateQuestion();
      }
  }
}
