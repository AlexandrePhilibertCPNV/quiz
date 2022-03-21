class Question {
  String caption;
  List<String> answers;
  String correctAnswer;
  String hint;

  Question(this.caption, this.answers, this.correctAnswer, this.hint);

  factory Question.empty() {
    return Question("", ["", "", "", ""], "", "");
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    List<String> answers = json['answers'].cast<String>();

    return Question(
      json['caption'],
      answers,
      answers[json['correct_answer_index']],
      json['hint'],
    );
  }
}
