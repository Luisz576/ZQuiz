import 'package:signals/signals.dart';
import 'package:zquiz/interactor/contracts/repositories/question_repository.dart';
import 'package:zquiz/interactor/states/questions_state.dart';

class QuestionSignals{
  final IQuestionRepository repository;
  QuestionSignals(this.repository);

  final Signal<QuestionsState> _state = signal(QuestionsState.start());
  Signal<QuestionsState> get state => _state;

  isLoading() => computed(() => _state.value.isLoading);
  hasData() => computed(() => _state.value.questions.isNotEmpty);
  hasError() => computed(() => _state.value.exception != null);

  fetchQuestions() async{
    _state.value = _state.value.setLoading();

    _state.value = (await repository.fetchQuestions(10)).fold(
      (left) => _state.value.setException(left),
      (right) => _state.value.setGetted(right),
    );
  }
}
