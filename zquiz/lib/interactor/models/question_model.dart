import 'package:zquiz/interactor/models/option_question_model.dart';

enum QuestionDifficulty{
  easy,
  medium,
  hard
}

class QuestionModel{
  final String questionText, explanation, category;
  final List<OptionQuestionModel> options;
  final QuestionDifficulty difficulty;
  
  const QuestionModel({
    required this.category,
    required this.questionText,
    required this.explanation,
    required this.options,
    required this.difficulty
  });
}