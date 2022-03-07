import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz/models/question.dart';
import 'package:quiz/services/question_provider.dart';

class QuestionIoProvider implements QuestionProvider {
  @override
  Future<Question> fetch() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:4567/questions/next'));

    if (response.statusCode == 200) {
      return Question.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.reasonPhrase!);
    }
  }
}
