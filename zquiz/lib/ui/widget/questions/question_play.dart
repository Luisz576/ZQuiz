import 'package:flutter/material.dart';
import 'package:zquiz/interactor/entity/question_entity.dart';

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

  bool get isAtTheEnd => widget.questions.length > _currentQuestion + 1;

  nextQuestion(bool gotItRight){
    setState(() {
      if(gotItRight){
        _errors++;
      }else{
        _hits++;
      }
      _currentQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isAtTheEnd ?
      const Column(
        // TODO: title
      )
    : const Column(
      children: [
        // TODO: question
      ],
    );
  }
}
