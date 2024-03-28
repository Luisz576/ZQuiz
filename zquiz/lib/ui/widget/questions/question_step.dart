import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zquiz/interactor/entity/question_entity.dart';
import 'package:zquiz/interactor/signals/current_selected_question_signal.dart';
import 'package:zquiz/ui/theme/zquiz_colors.dart';
import 'package:zquiz/ui/theme/zquiz_dimensions.dart';
import 'package:zquiz/ui/widget/questions/question_options_list.dart';

class QuestionStep extends StatefulWidget {
  final QuestionEntity question;
  final int questionNumber;
  final Function(bool) nextQuestionCallback;
  const QuestionStep({
    required this.question,
    required this.questionNumber,
    required this.nextQuestionCallback,
    super.key
  });

  @override
  State<QuestionStep> createState() => _QuestionStepState();
}

class _QuestionStepState extends State<QuestionStep> {
  final CurrentSelectedQuestionSignal signal = CurrentSelectedQuestionSignal();

  _onOptionPressed(OptionQuestion markedOption){
    signal.select(markedOption);
  }

  _nextQuestion(){
    widget.nextQuestionCallback(signal.state.value.option!.correctAnswer);
    signal.reset();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            color: ZQuizColors.secundaryBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: ZquizDimensions.smallPadding,
                vertical: ZquizDimensions.tinyPadding
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Question ${widget.questionNumber}",
                        style: const TextStyle(
                          fontSize: ZquizDimensions.mediumFontSize,
                          fontWeight: FontWeight.bold,
                          color: ZQuizColors.blackColor,
                          decoration: TextDecoration.underline
                        ),
                      ),
                      Watch((context) => TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: ZquizDimensions.smallPadding,
                            vertical: ZquizDimensions.tinyPadding,
                          ),
                          backgroundColor: ZQuizColors.primaryColor,
                          disabledBackgroundColor: ZQuizColors.grayColor,
                        ),
                        onPressed: signal.hasSelected()() ?
                            _nextQuestion
                            : null,
                        child: const Text("Next",
                          style: TextStyle(
                            color: ZQuizColors.whiteColor,
                            fontSize: ZquizDimensions.smallFontSize,
                            letterSpacing: 2
                          ),
                        )
                      ))
                    ],
                  ),
                  const SizedBox(height: ZquizDimensions.tinyPadding),
                  Text(widget.question.questionText,
                    style: const TextStyle(
                      fontSize: ZquizDimensions.smallFontSize,
                      color: ZQuizColors.blackColor,
                    ),
                  ),
                  Text(signal.hasSelected()() ? widget.question.explanation : "",
                    style: const TextStyle(
                      fontSize: ZquizDimensions.tinyFontSize,
                      color: ZQuizColors.blackColor,
                    ),
                  ),
                  (signal.hasSelected()() && widget.question.explanation.isNotEmpty)
                  ? const SizedBox(height: ZquizDimensions.smallPadding) : Container(),
                ],
              ),
            ),
          ),
          Expanded(
            child: QuestionOptionsList(
              options: widget.question.options,
              onOptionPressed: _onOptionPressed,
              signal: signal
            ),
          )
        ],
      ),
    );
  }
}
