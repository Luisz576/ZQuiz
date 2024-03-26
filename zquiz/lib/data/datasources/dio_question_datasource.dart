import 'package:dio/dio.dart';
import 'package:zquiz/interactor/contracts/datasources/question_datasource.dart';

class DioQuestionDatasource implements IQuestionDatasource{
  final Dio dio;
  const DioQuestionDatasource(this.dio);
}