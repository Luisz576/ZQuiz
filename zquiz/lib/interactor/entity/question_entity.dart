import 'package:zquiz/interactor/entity/option_question_entity.dart';

enum QuestionDifficulty{
  easy,
  medium,
  hard
}

class QuestionEntity{
  final String questionText, explanation, category;
  final List<OptionQuestionEntity> options;
  final QuestionDifficulty difficulty;

  const QuestionEntity({
    required this.category,
    required this.questionText,
    required this.explanation,
    required this.options,
    required this.difficulty
  });
}
