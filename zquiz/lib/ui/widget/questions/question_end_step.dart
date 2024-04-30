import 'package:flutter/material.dart';
import 'package:zquiz/get_it_locator.dart';
import 'package:zquiz/interactor/signals/game_user_signal.dart';
import 'package:zquiz/ui/theme/zquiz_colors.dart';
import 'package:zquiz/ui/theme/zquiz_dimensions.dart';

class QuestionEndStep extends StatelessWidget {
  final Function() onEndButtonPressed;
  final int errors, hits;

  int get total => errors + hits;

  const QuestionEndStep({
    required this.onEndButtonPressed,
    required this.errors,
    required this.hits,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("ZQuiz - End",
              style: TextStyle(
                color: ZQuizColors.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: ZquizDimensions.largeFontSize
              ),
            ),
            const SizedBox(height: ZquizDimensions.smallPadding,),
            Text("${GetItLocator.get<GameUserSignal>().state.value.username}, aqui está sua pontuação",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: ZQuizColors.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: ZquizDimensions.largeFontSize
              ),
            ),
            const SizedBox(height: ZquizDimensions.smallPadding,),
            Text("Acertos: $hits/$total",
              style: const TextStyle(
                color: ZQuizColors.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: ZquizDimensions.largeFontSize
              ),
            ),
            Text("Erros: $errors/$total",
              style: const TextStyle(
                color: ZQuizColors.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: ZquizDimensions.largeFontSize
              ),
            ),
            const SizedBox(height: ZquizDimensions.smallPadding,),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: ZQuizColors.primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: ZquizDimensions.smallPadding,
                  vertical:  ZquizDimensions.tinyPadding
                ),
              ),
              onPressed: onEndButtonPressed,
              child: const Text("Return",
                style: TextStyle(
                  color: ZQuizColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: ZquizDimensions.mediumFontSize
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
