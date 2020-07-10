import 'package:experiments_with_flutter/splash_intro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExperimentalApp());
}

class ExperimentalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashIntro(), debugShowCheckedModeBanner: false);
  }
}
