import 'package:fpdart/fpdart.dart';
import 'package:zquiz/interactor/entity/question_entity.dart';
import 'package:zquiz/interactor/exception/question_exception.dart';

abstract interface class IQuestionRepository{
  Future<Either<QuestionException, List<QuestionEntity>>> fetchQuestions(int amount);
}
