import 'package:zquiz/interactor/models/question_model.dart';

sealed class QuestionsState{
  final List<QuestionModel> questions;

  const QuestionsState({
    required this.questions
  });
  factory QuestionsState.start() => const StartQuestionsState();
}

class StartQuestionsState extends QuestionsState{
  const StartQuestionsState() : super(
    questions: const []
  );
}
