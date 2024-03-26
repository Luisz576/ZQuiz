import 'package:flutter/material.dart';
import 'package:zquiz/ui/theme/zquiz_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ZQuizColors.secundaryColor,
        centerTitle: true,
        title: const Text("ZQuiz"),
      ),
      body: Container(),
      backgroundColor: ZQuizColors.primaryBackgroundColor,
    );
  }
}