import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:quiz/managers/question_manager.dart';
import 'package:quiz/models/question.dart';

class GameScreen extends StatelessWidget with GetItMixin {
  GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AsyncSnapshot<Question> questionSnapshot =
        watchStream((QuestionManager m) => m.stream, Question.none());

    final Question question = questionSnapshot.data!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions'),
      ),
      body: Center(
        child: questionSnapshot.hasData
            ? Column(
                children: [
                  Text(question.caption),
                  Row(
                    children: question.answers.map((answer) {
                      return ElevatedButton(
                        child: Text(answer),
                        onPressed: () {},
                      );
                    }).toList(),
                  )
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
