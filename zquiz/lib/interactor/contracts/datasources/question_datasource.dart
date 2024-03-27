import 'package:zquiz/interactor/entity/question_entity.dart';

abstract interface class IQuestionDatasource{
  Future<List<QuestionEntity>> getQuestions(int amount);
}
