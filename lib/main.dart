import 'package:experiments_with_flutter/expandable_menu_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExperimentalApp());
}

class ExperimentalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ExpandableMenuAnimation(), debugShowCheckedModeBanner: false);
  }
}
