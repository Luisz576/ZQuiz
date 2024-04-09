import 'package:signals/signals_flutter.dart';
import 'package:zquiz/interactor/entity/game_user.dart';

class GameUserSignal{
  final state = signal(GameUser.empty());
  late final isValid = computed(() => state.value.isValid);

  setInfo(String username, int amountOfQuestions){
    state.value = GameUser(
      username: username,
      amountOfQuestions: amountOfQuestions
    );
  }
}
