import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zquiz/get_it_locator.dart';
import 'package:zquiz/interactor/signals/game_user_signal.dart';
import 'package:zquiz/ui/screens/config_screen.dart';
import 'package:zquiz/ui/screens/home_screen.dart';

class ZQuizApp extends StatelessWidget {
  const ZQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Watch(
        (context) => GetItLocator.get<GameUserSignal>().isValid() ?
          const HomeScreen()
          : const ConfigScreen()
      ),
    );
  }
}
