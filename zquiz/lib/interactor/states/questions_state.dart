import 'package:zquiz/interactor/entity/question_entity.dart';
import 'package:zquiz/interactor/exception/question_exception.dart';

sealed class QuestionsState{
  final List<QuestionEntity> questions;
  final bool isLoading;
  final QuestionException? exception;

  const QuestionsState({
    required this.questions,
    required this.isLoading,
    this.exception
  });
  factory QuestionsState.start() => const StartQuestionsState();

  LoadingQuestionsState setLoading() => LoadingQuestionsState(questions: questions);

  GettedQuestionsState setGetted(List<QuestionEntity> questions) =>
      GettedQuestionsState(
        questions: questions
      );

  ErrorQuestionsState setException(QuestionException exception) =>
      ErrorQuestionsState(
        questions: questions,
        exception: exception
      );
}

class StartQuestionsState extends QuestionsState{
  const StartQuestionsState() : super(
    questions: const [],
    isLoading: false
  );
}

class LoadingQuestionsState extends QuestionsState{
  const LoadingQuestionsState({
    required super.questions
  }) : super(isLoading: true);
}

class GettedQuestionsState extends QuestionsState{
  const GettedQuestionsState({
    required super.questions
  }) : super(isLoading: false);
}

class ErrorQuestionsState extends QuestionsState{
  const ErrorQuestionsState({
    required super.questions,
    required super.exception
  }) : super(isLoading: false);
}
