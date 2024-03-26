import 'package:zquiz/interactor/contracts/datasources/question_datasource.dart';
import 'package:zquiz/interactor/contracts/repositories/question_repository.dart';

class QuestionRepository implements IQuestionRepository{
  final IQuestionDatasource datasource;
  const QuestionRepository(this.datasource);
}