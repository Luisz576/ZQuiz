enum QuestionDifficulty{
  unknown,
  easy,
  medium,
  hard
}

class OptionQuestion{
  final String text;
  final bool correctAnswer;

  const OptionQuestion({
    required this.text,
    required this.correctAnswer
  });
}

class QuestionEntity{
  final String questionText, explanation, category;
  final List<OptionQuestion> options;
  final QuestionDifficulty difficulty;

  bool get isEmpty => questionText.isNotEmpty && options.isNotEmpty;

  const QuestionEntity({
    required this.category,
    required this.questionText,
    required this.explanation,
    required this.options,
    required this.difficulty
  });

  QuestionEntity.empty() :
    questionText = "",
    category = "",
    explanation = "",
    difficulty = QuestionDifficulty.unknown,
    options = [];
}
