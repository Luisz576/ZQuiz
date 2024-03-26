import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:zquiz/data/datasources/dio_question_datasource.dart';
import 'package:zquiz/data/repositories/question_repository.dart';
import 'package:zquiz/interactor/contracts/datasources/question_datasource.dart';
import 'package:zquiz/interactor/contracts/repositories/question_repository.dart';

class GetItLocator{
  static setup(){
    // dio
    registerSingleton<Dio>(
      Dio()
    );

    // datasource
    registerSingleton<IQuestionDatasource>(
        DioQuestionDatasource(
          get<Dio>()
        )
    );

    // repository
    registerSingleton<IQuestionRepository>(
      QuestionRepository(
        get<IQuestionDatasource>()
      )
    );
  }

  static T get<T extends Object>(){
    return GetIt.instance.get<T>();
  }
  static registerSingleton<T extends Object>(T instance){
    GetIt.instance.registerSingleton(instance);
  }
}