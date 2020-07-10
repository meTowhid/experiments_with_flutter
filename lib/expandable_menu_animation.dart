import 'package:flutter/material.dart';

class ExpandableMenuAnimation extends StatefulWidget {
  @override
  _ExpandableMenuAnimationState createState() => _ExpandableMenuAnimationState();
}

class _ExpandableMenuAnimationState extends State<ExpandableMenuAnimation> {
  final Duration d = Duration(milliseconds: 200);
  final Curve c = Curves.easeOut;
  int _index = 0;

  double baseHeight = 70;
  double peekHeight = 60;
  double extendedHeight = 80;
  var cards = [Colors.blue.shade500, Colors.blue.shade400, Colors.blue.shade300, Colors.blue.shade200, Colors.blue.shade100];

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    double cardMaxHeight = h / cards.length;

    int i = 0;
    var cardsList = cards.map((color) {
      i++;
      double calculatedHeight = (cards.length - i) * peekHeight + baseHeight;
      return _card(index: i - 1, height: calculatedHeight, color: color);
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Stack(alignment: Alignment.bottomCenter, children: cardsList..reversed),
        ),
      ),
    );
  }

  AnimatedContainer _card({int index, double height, Color color = Colors.red}) {
    double extra = _index != -1 && _index >= index ? extendedHeight : 0;
    print('$height > $extra');
    return AnimatedContainer(
      curve: c,
      duration: d,
      height: height + extra,
      width: double.infinity,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
      child: InkWell(
          onTap: () {
            _onTap(index);
          },
          child: _cardContent()),
    );
  }

  _cardContent() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(children: <Widget>[
        Text('title', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 25),
        Text(dummyTet),
      ]),
    );
  }

  _onTap(index) {
    print(index);
    setState(() {
      _index = _index == index ? -1 : index;
    });
  }

  String dummyTet =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s";
}
