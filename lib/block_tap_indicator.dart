import 'package:flutter/material.dart';

class SimpleBlockTapIndicator extends StatefulWidget {
  @override
  _SimpleBlockTapIndicatorState createState() => _SimpleBlockTapIndicatorState();
}

class _SimpleBlockTapIndicatorState extends State<SimpleBlockTapIndicator> {
  int _tapedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Row(mainAxisSize: MainAxisSize.min, children: List.generate(4, (index) => _buildBlock(index))),
            TweenAnimationBuilder(
              curve: Curves.elasticOut,
              duration: Duration(milliseconds: 150),
              tween: Tween<double>(begin: 25, end: -25),
              builder: (BuildContext context, double value, Widget child) {
                return AnimatedPositioned(
                  curve: Curves.easeOut,
                  duration: Duration(milliseconds: 300),
                  left: _tapedItemIndex * 60.0 + 22.5,
                  top: value,
                  child: child,
                );
              },
              child: Container(width: 15, height: 15, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red)),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBlock(int index) {
    return InkWell(
      onTap: () {
        print(index);
        setState(() {
          _tapedItemIndex = index;
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.all(5),
        duration: Duration(milliseconds: 300),
        color: _tapedItemIndex == index ? Colors.red : Colors.amber,
        width: 50,
        height: 50,
      ),
    );
  }
}
