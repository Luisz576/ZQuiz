import 'package:envied/envied.dart';

part 'zquiz_env.g.dart';

@Envied(path: '.env')
abstract class ZQuizEnv {
  @EnviedField(varName: 'TOKEN_KEY')
  static const String tokenKey = _ZQuizEnv.tokenKey;

  @EnviedField(varName: 'API_URL')
  static const String apiUrl = _ZQuizEnv.apiUrl;
}
