import 'package:flutter/material.dart';

class SplashIntro extends StatefulWidget {
  @override
  _SplashIntroState createState() => _SplashIntroState();
}

class _SplashIntroState extends State<SplashIntro> {
  int _screenIndex = 0;
  List<List<Circle>> _screens = [];

  final Duration d = Duration(milliseconds: 2000);
  final Curve c = Curves.elasticOut;

  _calculateScreenDesignData(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    _screens = [
      [
        Circle(x: w / 2, y: 0, radius: 0, color: Colors.white),
        Circle(x: w / 2, y: h, radius: 0, color: Colors.white),
        Circle(x: w / 2, y: h / 2, radius: 0, color: Colors.white),
      ],
      [
        Circle(x: 0, y: h - h / 2 - 50 + 10, radius: h + 100, color: Colors.deepPurple),
        Circle(x: 0, y: h - h * .3 + 10, radius: h * .6, color: Colors.orange),
        Circle(x: 0, y: h - h * .2 + 10, radius: h * .4, color: Colors.amber),
      ],
      [
        Circle(x: w / 2, y: h - h / 2 - 50, radius: h + 100, color: Colors.amber),
        Circle(x: w / 2, y: h * .6, radius: h * .6, color: Colors.deepPurple),
        Circle(x: w / 2, y: h, radius: h * .6, color: Colors.orange),
      ],
      [
        Circle(x: w, y: 50, radius: w * 2, color: Colors.orange),
        Circle(x: 50, y: h - 100, radius: w * 2, color: Colors.deepPurple),
        Circle(x: 0, y: h / 4, radius: h / 2, color: Colors.amber),
      ],
      [
        Circle(x: 50, y: h - 100, radius: w * 2, color: Colors.deepPurple),
        Circle(x: w - 50, y: 100, radius: w * 2, color: Colors.orange),
        Circle(x: w, y: h * .75, radius: h / 2, color: Colors.amber),
      ],
    ];
  }

  @override
  Widget build(BuildContext context) {
    _calculateScreenDesignData(context);

    return Scaffold(
      body: InkWell(
        onTap: _onTap,
        child: Stack(
          children: <Widget>[
            ..._screens[_screenIndex]
                .map((circle) => AnimatedPositioned(
                      curve: c,
                      duration: d,
                      left: circle.x - circle.radius / 2,
                      top: circle.y - circle.radius / 2,
                      child: _circle(circle.radius, circle.color),
                    ))
                .toList(),
//            Align(alignment: Alignment.center, child: Text('$_screenIndex', style: TextStyle(fontSize: 30))),
          ],
        ),
      ),
    );
  }

  _circle(radius, color) => AnimatedContainer(
        duration: d,
        width: radius,
        height: radius,
        curve: radius < 200 ? Curves.easeOut : c,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      );

  _onTap() {
    setState(() {
      if (_screenIndex == _screens.length - 1)
        _screenIndex = 0;
      else
        _screenIndex++;
      print(_screenIndex);
    });
  }
}

class Circle {
  double x, y, radius;
  Color color;

  Circle({this.x = 0, this.y = 0, this.radius = 100, this.color = Colors.red});
}
