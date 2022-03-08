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
            ? Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 28.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      question.caption,
                      style: const TextStyle(fontSize: 24.0),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: question.answers.map(
                        (answer) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: TextButton(
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
                              child: Text(answer),
                              onPressed: () {},
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
