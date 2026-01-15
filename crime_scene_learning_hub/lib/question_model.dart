class Question {
  final String question;
  final String type; // single-select | multi-select | order
  final List<String> options;
  final dynamic correctAnswer;

  Question({
    required this.question,
    required this.type,
    required this.options,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    final rawAnswer = json['correctAnswer'];

    dynamic parsedAnswer;

    if (rawAnswer is List) {
      parsedAnswer = rawAnswer.map((e) => e as int).toList();
    } else {
      parsedAnswer = rawAnswer as int;
    }

    return Question(
      question: json['question'] as String,
      type: json['type'] as String,
      options: List<String>.from(json['options']),
      correctAnswer: parsedAnswer,
    );
  }
}

class QuestionList {
  final List<Question> questions;

  QuestionList({required this.questions});

  factory QuestionList.fromJson(Map<String, dynamic> json) {
    return QuestionList(
      questions: (json['questions'] as List)
          .map((q) => Question.fromJson(q))
          .toList(),
    );
  }
}
