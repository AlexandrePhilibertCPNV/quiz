import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:quiz/managers/question_manager.dart';
import 'package:quiz/managers/score_manager.dart';
import 'package:quiz/models/question.dart';

class GameScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  GameScreen({Key? key}) : super(key: key) {
    GetIt.I.get<QuestionManager>();
  }

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with GetItStateMixin {
  bool isHintVisible = false;

  _GameScreenState() {
    QuestionManager questionManager = GetIt.I.get<QuestionManager>();
    questionManager.next();
  }

  @override
  void dispose() {
    GetIt.I.get<QuestionManager>().closeStream();
    GetIt.I.unregister<QuestionManager>();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AsyncSnapshot<Question> questionSnapshot = watchStream(
      (QuestionManager m) => m.stream,
      Question.empty(),
    );

    final ScoreManager scoreManager = GetIt.I.get<ScoreManager>();
    final QuestionManager questionManager = GetIt.I.get<QuestionManager>();
    final Question question = questionSnapshot.data!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Score : ${scoreManager.score}")],
            ),
          ),
        ],
      ),
      body: Center(
        child: questionSnapshot.hasData
            ? Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 40.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          question.caption,
                          style: const TextStyle(fontSize: 24.0),
                        ),
                        const SizedBox(height: 20.0),
                        isHintVisible ? Text(question.hint) : Container(),
                      ],
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: question.answers.map(
                        (answer) {
                          return Container(
                            margin: const EdgeInsets.only(
                              top: 10.0,
                              bottom: 20.0,
                              left: 10.0,
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
                              onPressed: () {
                                if (answer == question.correctAnswer) {
                                  scoreManager.add(1);
                                }

                                setState(() {
                                  isHintVisible = false;
                                });

                                questionManager.next();
                              },
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
      floatingActionButton: isHintVisible
          ? null
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  isHintVisible = true;
                });
              },
              child: const Text(
                "?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
    );
  }
}
