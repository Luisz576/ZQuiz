import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zquiz/get_it_locator.dart';
import 'package:zquiz/interactor/contracts/repositories/question_repository.dart';
import 'package:zquiz/interactor/entity/question_entity.dart';
import 'package:zquiz/interactor/signals/questions_signal.dart';
import 'package:zquiz/interactor/states/questions_state.dart';
import 'package:zquiz/ui/theme/zquiz_colors.dart';
import 'package:zquiz/ui/theme/zquiz_dimensions.dart';
import 'package:zquiz/ui/widget/centered_text.dart';
import 'package:zquiz/ui/widget/questions/question_play.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final questionsSignals = QuestionSignals(GetItLocator.get<IQuestionRepository>());

  @override
  void initState() {
    super.initState();
    questionsSignals.fetchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ZQuizColors.secundaryColor,
        centerTitle: true,
        title: const Text("ZQuiz - Let's Play!"),
      ),
      backgroundColor: ZQuizColors.primaryBackgroundColor,
      body: Watch((context) => switch(questionsSignals.state.value){
        StartQuestionsState() || LoadingQuestionsState() => const Center(
          child: CircularProgressIndicator(
            color: ZQuizColors.primaryColor,
          ),
        ),
        ErrorQuestionsState() => const CenteredText(
          text: "Um erro ocorreu",
          style: TextStyle(
            color: ZQuizColors.primaryColor,
            fontSize: ZquizDimensions.largeFontSize,
          ),
        ),
        GettedQuestionsState(questions:List<QuestionEntity> questions) => questions.isNotEmpty ?
          QuestionPlay(
            questions: questions,
          )
          : const CenteredText(
            text: "Não foi possível carregar questões :(",
            style: TextStyle(
              color: ZQuizColors.primaryColor,
              fontSize: ZquizDimensions.mediumFontSize,
            ),
          )
      }),
    );
  }
}
