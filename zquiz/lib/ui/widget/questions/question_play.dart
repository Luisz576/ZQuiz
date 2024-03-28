import 'package:flutter/material.dart';
import 'package:zquiz/interactor/entity/question_entity.dart';
import 'package:zquiz/ui/widget/questions/question_end_step.dart';
import 'package:zquiz/ui/widget/questions/question_step.dart';

class QuestionPlay extends StatefulWidget {
  final List<QuestionEntity> questions;
  const QuestionPlay({
    required this.questions,
    super.key
  });

  @override
  State<QuestionPlay> createState() => _QuestionPlayState();
}

class _QuestionPlayState extends State<QuestionPlay> {
  int _currentQuestion = 0, _errors = 0, _hits = 0;

  bool get isAtTheEnd => _currentQuestion + 1 >= widget.questions.length;

  _nextQuestion(bool gotItRight){
    setState(() {
      if(gotItRight){
        _hits++;
      }else{
        _errors++;
      }
      _currentQuestion++;
    });
  }

  _end(){
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return isAtTheEnd ?
      QuestionEndStep(
        onEndButtonPressed: _end,
        errors: _errors,
        hits: _hits,
      )
    : QuestionStep(
      questionNumber: _currentQuestion + 1,
      question: widget.questions[_currentQuestion],
      nextQuestionCallback: _nextQuestion
    );
  }
}
