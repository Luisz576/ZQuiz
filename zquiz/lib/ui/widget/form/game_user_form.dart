import 'package:flutter/material.dart';
import 'package:zquiz/data/dtos/game_user_data.dart';
import 'package:zquiz/ui/theme/zquiz_colors.dart';
import 'package:zquiz/ui/theme/zquiz_dimensions.dart';
import 'package:zquiz/ui/widget/form/input/number_input.dart';
import 'package:zquiz/ui/widget/form/input/text_input.dart';

class GameUserForm extends StatelessWidget {
  final GameUserData gameUserData = GameUserData();
  GameUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextInput(
            label: "Name",
            hintText: "Insert your name",
            valueObject: gameUserData.username,
          ),
          NumberInput(
            label: "Questions",
            hintText: "Number of questions",
            valueObject: gameUserData.amountOfQuestions,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: ZQuizColors.primaryColor,
              padding: const EdgeInsets.symmetric(
                horizontal: ZquizDimensions.smallPadding,
                vertical:  ZquizDimensions.tinyPadding
              ),
            ),
            onPressed: (){
              // TODO:
            },
            child: const Text(
              "Let's GO!",
              style: TextStyle(
                color: ZQuizColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: ZquizDimensions.mediumFontSize
              ),
            )
          )
        ],
      ),
    );
  }
}
