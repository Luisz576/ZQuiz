import 'package:fpdart/fpdart.dart';
import 'package:zquiz/interactor/contracts/datasources/question_datasource.dart';
import 'package:zquiz/interactor/contracts/repositories/question_repository.dart';
import 'package:zquiz/interactor/entity/question_entity.dart';
import 'package:zquiz/interactor/exception/question_exception.dart';

class QuestionRepository implements IQuestionRepository{
  final IQuestionDatasource datasource;
  const QuestionRepository(this.datasource);

  @override
  Future<Either<QuestionException, List<QuestionEntity>>> fetchQuestions(int amount) async{
    try{
      return Right(await datasource.getQuestions(amount));
    }on QuestionException catch(e){
      return Left(e);
    }
  }
}
