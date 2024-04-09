import 'package:flutter/material.dart';
import 'package:zquiz/ui/theme/zquiz_colors.dart';
import 'package:zquiz/ui/theme/zquiz_dimensions.dart';
import 'package:zquiz/ui/widget/form/game_user_form.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ZQuizColors.secundaryColor,
        centerTitle: true,
        title: const Text("ZQuiz",
          style: TextStyle(
            color: ZQuizColors.whiteColor,
            fontSize: ZquizDimensions.largeFontSize,
            letterSpacing: 1,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      backgroundColor: ZQuizColors.primaryBackgroundColor,
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png",
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * 0.6,
            ),
            const SizedBox(height: ZquizDimensions.tinyPadding,),
            const Text("Let's Start!",
              style: TextStyle(
                color: ZQuizColors.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: ZquizDimensions.largeFontSize
              ),
            ),
            const SizedBox(height: ZquizDimensions.largePadding,),
            GameUserForm()
          ]
        ),
      ),
    );
  }
}
