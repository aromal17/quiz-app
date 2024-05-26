import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  var activeScreenVar = "start-screen";
  List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
      activeScreenVar = (activeScreenVar == "start-screen")
          ? "question-screen"
          : "start-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreenVar = "result-screen";
        activeScreen = ResultScreen(resetQuiz: resetQuiz, chosenAnswers: selectedAnswers,);
        selectedAnswers = [];
      });
    }
  }

  void resetQuiz(){
    setState(() {
       activeScreen = StartScreen(switchScreen);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 61, 6, 128),
          Color.fromARGB(255, 93, 37, 162)
        ])),
        child: activeScreen
      )),
    );
  }
}
