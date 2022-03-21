import 'package:flutter/material.dart';
import 'package:quiz/managers/question_manager.dart';
import 'package:quiz/screens/game_screen.dart';

class DifficultyButton extends StatelessWidget {
  const DifficultyButton({Key? key, required this.child, this.onPressed})
      : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: const BorderSide(
            color: Colors.blue,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: child,
      onPressed: onPressed,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DifficultyButton(
              child: const Text("Rookie"),
              onPressed: () => onPressed(context),
            ),
            DifficultyButton(
              child: const Text("Journeyman"),
              onPressed: () => onPressed(context),
            ),
            DifficultyButton(
              child: const Text("Warrior"),
              onPressed: () => onPressed(context),
            ),
            DifficultyButton(
              child: const Text("Ninja"),
              onPressed: () => onPressed(context),
            ),
          ],
        ),
      ),
    );
  }

  void onPressed(BuildContext context) {
    QuestionManager.register();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(),
      ),
    );
  }
}
