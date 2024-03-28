import 'package:flutter/material.dart';
import 'package:zquiz/ui/screens/home_screen.dart';

class ZQuizApp extends StatelessWidget {
  const ZQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
