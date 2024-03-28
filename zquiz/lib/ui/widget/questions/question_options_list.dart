import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zquiz/interactor/entity/question_entity.dart';
import 'package:zquiz/interactor/signals/current_selected_question_signal.dart';
import 'package:zquiz/ui/widget/questions/question_option_tile.dart';

class QuestionOptionsList extends StatefulWidget {
  final List<OptionQuestion> options;
  final Function(OptionQuestion option) onOptionPressed;
  final CurrentSelectedQuestionSignal signal;
  const QuestionOptionsList({
    required this.options,
    required this.onOptionPressed,
    required this.signal,
    super.key,
  });

  @override
  State<QuestionOptionsList> createState() => _QuestionOptionsListState();
}

class _QuestionOptionsListState extends State<QuestionOptionsList> {
  @override
  Widget build(BuildContext context) {
    return Watch((context) => ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: widget.options.length,
      itemBuilder: (context, index) => QuestionOptionTile(
          option: widget.options[index],
          canMark: !widget.signal.hasSelected()(),
          marked: widget.signal.getSelected() == widget.options[index],
          onPressed: () => setState(() => widget.onOptionPressed(widget.options[index])),
        )
    ),);
  }
}
