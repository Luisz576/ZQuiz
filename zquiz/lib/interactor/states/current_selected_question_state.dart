import 'package:zquiz/interactor/entity/question_entity.dart';

sealed class CurrentSelectedQuestionState{
  final OptionQuestion? option;
  const CurrentSelectedQuestionState(this.option);
  factory CurrentSelectedQuestionState.start() => NoCurrentSelectedQuestionState();

  reset() => NoCurrentSelectedQuestionState();
  select(OptionQuestion option) => HasCurrentSelectedQuestionState(option);
}

class NoCurrentSelectedQuestionState extends CurrentSelectedQuestionState{
  NoCurrentSelectedQuestionState() : super(null);
}

class HasCurrentSelectedQuestionState extends CurrentSelectedQuestionState{
  const HasCurrentSelectedQuestionState(super.option);
}
