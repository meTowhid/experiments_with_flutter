import 'package:experiments_with_flutter/trigonometric_circles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExperimentalApp());
}

class ExperimentalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TrigonometricCircles(), debugShowCheckedModeBanner: false);
  }
}
