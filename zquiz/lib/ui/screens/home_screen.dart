import 'package:flutter/material.dart';
import 'package:zquiz/ui/screens/questions_screen.dart';
import 'package:zquiz/ui/theme/zquiz_colors.dart';
import 'package:zquiz/ui/theme/zquiz_dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  _play(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const QuestionsScreen(),
    ));
  }

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
            const Text("Welcome to the ZQuiz!",
              style: TextStyle(
                color: ZQuizColors.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: ZquizDimensions.largeFontSize
              ),
            ),
            const SizedBox(height: ZquizDimensions.mediumPadding,),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: ZQuizColors.primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: ZquizDimensions.smallPadding,
                  vertical:  ZquizDimensions.tinyPadding
                ),
              ),
              onPressed: () => _play(context),
              child: const Text("Play",
                style: TextStyle(
                  color: ZQuizColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: ZquizDimensions.mediumFontSize
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}
