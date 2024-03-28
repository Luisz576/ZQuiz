import 'package:signals/signals.dart';
import 'package:zquiz/interactor/entity/question_entity.dart';
import 'package:zquiz/interactor/states/current_selected_question_state.dart';

class CurrentSelectedQuestionSignal{
  final Signal<CurrentSelectedQuestionState> _state = signal(CurrentSelectedQuestionState.start());
  Signal<CurrentSelectedQuestionState> get state => _state;

  Computed<bool> hasSelected() => computed(() => state.value is HasCurrentSelectedQuestionState);

  OptionQuestion? getSelected() => _state.value.option;

  select(OptionQuestion option){
    _state.value = _state.value.select(option);
  }

  reset(){
    _state.value = _state.value.reset();
  }
}
