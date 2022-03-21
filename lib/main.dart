import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz/managers/game_manager.dart';
import 'package:quiz/managers/score_manager.dart';
import 'package:quiz/screens/home_screen.dart';

GetIt getIt = GetIt.instance;

void main() {
  GameManager.register();
  ScoreManager.register();

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
      home: const HomeScreen(),
    );
  }
}
