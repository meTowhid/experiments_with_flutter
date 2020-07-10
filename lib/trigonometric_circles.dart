import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TrigonometricCircles extends StatefulWidget {
  @override
  _TrigonometricCirclesState createState() => _TrigonometricCirclesState();
}

class _TrigonometricCirclesState extends State<TrigonometricCircles> {
  double cx, cy, multiplier = 0, count = 100;
  int total = 100;

  @override
  Widget build(BuildContext context) {
    cx = MediaQuery.of(context).size.width / 2;
    cy = MediaQuery.of(context).size.height / 2;

    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
          Expanded(child: Stack(children: [...List.generate(total, (index) => _circle(index)).toList()])),
          Slider.adaptive(max: 10, min: 0, value: multiplier, onChanged: _onChange),
          Slider.adaptive(max: 300, min: 1, value: count, onChanged: _onChangeCount),
        ]),
      ),
    );
  }

  _onChangeCount(v) {
    setState(() {
      total = v.round();
      count = v;
    });
  }

  _onChange(v) {
    setState(() {
      multiplier = v;
    });
  }

  _circle(int i) {
    var x = cos(i) * multiplier * i;
    var y = sin(i) * multiplier * i;
    double radius = 2.0 * (i / 5);
    double opc = i / total;
//    print('$x, $y');
    return Positioned(
      left: cx + x - radius / 2,
      top: cy + y - radius / 2,
      child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
//            color: Colors.blue.withOpacity(opc),
            border: Border.all(color: Colors.blue, width: 1 + opc * 5),
          ),
          width: radius,
          height: radius),
    );
  }
}
