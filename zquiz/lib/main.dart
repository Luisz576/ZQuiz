import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:zquiz/get_it_locator.dart';
import 'package:zquiz/ui/zquiz_app.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  GetItLocator.setup();

  FlutterNativeSplash.remove();
  runApp(const ZQuizApp());
}