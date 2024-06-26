import 'package:dio/dio.dart';
import 'package:zquiz/data/dtos/question_dto.dart';
import 'package:zquiz/interactor/contracts/datasources/question_datasource.dart';
import 'package:zquiz/interactor/entity/question_entity.dart';
import 'package:zquiz/interactor/exception/question_exception.dart';

class DioQuestionDatasource implements IQuestionDatasource{
  final Dio dio;
  final String baseUrl, key;
  const DioQuestionDatasource(this.dio, this.baseUrl, this.key);

  @override
  Future<List<QuestionEntity>> getQuestions(int amount) async {
    try{
      final response = await dio.get("$baseUrl/questions",
        queryParameters: {
          "apiKey": key,
          "limit": amount
        }
      );
      if(response.data is List){
        return (response.data as List).map(QuestionDTO.fromMap).toList();
      }
      throw QuestionException("Invalid data from api");
    } on DioException catch(e, s){
      throw QuestionException(e.message, s);
    }
  }
}
