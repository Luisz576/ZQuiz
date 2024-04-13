import 'package:flutter/material.dart';
import 'package:zquiz/data/dtos/game_user_data.dart';
import 'package:zquiz/get_it_locator.dart';
import 'package:zquiz/interactor/signals/game_user_signal.dart';
import 'package:zquiz/ui/theme/zquiz_colors.dart';
import 'package:zquiz/ui/theme/zquiz_dimensions.dart';
import 'package:zquiz/ui/widget/form/input/text_input.dart';

class GameUserForm extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final GameUserData gameUserData = GameUserData();
  GameUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInput(
                label: "Name",
                hintText: "Insert your name",
                valueObject: gameUserData.username,
                isDigit: false,
              ),
            ),
            const SizedBox(height: ZquizDimensions.tinyPadding,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInput(
                label: "Questions",
                hintText: "Number of questions",
                valueObject: gameUserData.amountOfQuestions,
                isDigit: true,
              ),
            ),
            const SizedBox(height: ZquizDimensions.tinyPadding,),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: ZQuizColors.primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: ZquizDimensions.smallPadding,
                  vertical:  ZquizDimensions.tinyPadding
                ),
              ),
              onPressed: (){
                if(formKey.currentState!.validate() && gameUserData.isValid){
                  GetItLocator.get<GameUserSignal>().setInfo(gameUserData.username.value, gameUserData.amountOfQuestions.value);
                }
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
      ),
    );
  }
}
