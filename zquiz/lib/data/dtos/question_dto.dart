import 'package:zquiz/interactor/entity/question_entity.dart';

QuestionDifficulty questionDifficultyFromText(String value){
  return switch(value.trim().toLowerCase()){
    "easy" => QuestionDifficulty.easy,
    "medium" => QuestionDifficulty.medium,
    "hard" => QuestionDifficulty.hard,
    String() => QuestionDifficulty.unknown,
  };
}

const List<String> apiOptios = ["a", "b", "c", "d", "e", "f"];
List<OptionQuestion> buildOptionsQuestion(Map answers, Map correctAnswers){
  List<OptionQuestion> options = [];

  for(String op in apiOptios){
    if(answers["answer_$op"] is String
      && correctAnswers["answer_${op}_correct"] is String){
      options.add(
        OptionQuestion(
          text: answers["answer_$op"],
          correctAnswer: correctAnswers["answer_${op}_correct"] == "true"
        )
      );
    }
  }

  return options;
}

class QuestionDTO extends QuestionEntity{
  QuestionDTO({
    required super.category,
    required super.questionText,
    required super.explanation,
    required super.options,
    required super.difficulty
  });
  QuestionDTO.empty() : super.empty();

  factory QuestionDTO.fromMap(dynamic map){
    if(map is Map){
      if(map case {
        "question": String questionText,
        "category": String category,
        "explanation": String? explanation,
        "difficulty": String difficulty,
        "answers": Map answers,
        "correct_answers": Map correctAnswers,
      }){
        return QuestionDTO(
          category: category,
          questionText: questionText,
          explanation: explanation ?? "",
          options: buildOptionsQuestion(answers, correctAnswers),
          difficulty: questionDifficultyFromText(difficulty)
        );
      }
    }
    return QuestionDTO.empty();
  }
}
