import 'package:experiments_with_flutter/widget/custom_nav_painter.dart';
import 'package:flutter/material.dart';

import 'custom_nav_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final List<CustomNavItem> items;
  final Function(int index) callback;
  final int initialSelectedIndex;

  CustomBottomNavigationBar({this.items, this.callback, this.initialSelectedIndex = 0});

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  double begin = 0;
  double selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialSelectedIndex.toDouble();
    begin = selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Column(
        children: <Widget>[
          TweenAnimationBuilder(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 300),
            tween: Tween<double>(begin: begin, end: selectedIndex),
            builder: (context, value, child) => CustomPaint(
              painter: CustomNavPainter(currentPosition: value, totalItem: widget.items.length),
              size: Size(MediaQuery.of(context).size.width, 30),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: widget.items.asMap().entries.map((i) => _buildNavItem(i.key, i.value)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, CustomNavItem item) => InkWell(
      child: Column(children: [Icon(item.icon), Text(item.title)]),
      onTap: () {
        setState(() {
          selectedIndex = index.toDouble();
          widget.callback.call(index);
        });
      });
}
