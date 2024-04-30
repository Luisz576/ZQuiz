import 'package:zquiz/interactor/entity/game_user.dart';
import 'package:zquiz/interactor/vo/number_vo.dart';
import 'package:zquiz/interactor/vo/text_vo.dart';

class GameUserData {
  final username = TextValueObject.create(minCaracters: 2, maxCaracters: 16);
  final amountOfQuestions = NumberValueObject.create(initialValue: 1, minV: 1, maxV: GameUser.maxQuestions);

  bool get isValid => username.validator(null) == null
      && amountOfQuestions.validator(null) == null;

  toGameUser(){
    return GameUser(
      username: username.value,
      amountOfQuestions: amountOfQuestions.value
    );
  }
}
