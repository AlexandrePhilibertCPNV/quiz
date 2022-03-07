import 'package:quiz/models/question.dart';

abstract class QuestionProvider {
  Future<Question> fetch();
}
