import 'package:experiments_with_flutter/block_tap_indicator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExperimentalApp());
}

class ExperimentalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SimpleBlockTapIndicator(), debugShowCheckedModeBanner: false);
  }
}
