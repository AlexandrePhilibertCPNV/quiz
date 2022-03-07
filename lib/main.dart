import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz/managers/question_manager.dart';
import 'package:quiz/screens/game_screen.dart';

GetIt getIt = GetIt.instance;

void main() {
  QuestionManager.register();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameScreen(),
    );
  }
}
