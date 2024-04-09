import 'dart:math';

import 'package:zquiz/interactor/entity/user.dart';

class GameUser extends User{
  static const int maxQuestions = 10;
  int amountOfQuestions;

  GameUser.empty() : amountOfQuestions = 0, super(username: "");

  bool get isValid => amountOfQuestions > 0 && username.isNotEmpty;

  GameUser({
    required super.username,
    required this.amountOfQuestions
  });

  GameUser.fromUser(User user, int amountOfQuestions) :
    amountOfQuestions = max(amountOfQuestions, maxQuestions),
    super(
      username: user.username
    );
}
