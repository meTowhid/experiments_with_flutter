import 'package:experiments_with_flutter/widget/custom_bottom_navigation_bar.dart';
import 'package:experiments_with_flutter/widget/custom_nav_item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
//        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          _buildScreen('Screen 1'),
          _buildScreen('Screen 2'),
          _buildScreen('Screen 3'),
          _buildScreen('Screen 4'),
          _buildScreen('Screen 5'),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        items: [
          CustomNavItem(icon: Icons.bubble_chart, title: 'Home'),
          CustomNavItem(icon: Icons.landscape, title: 'Search'),
          CustomNavItem(icon: Icons.brightness_3, title: 'Event'),
          CustomNavItem(icon: Icons.bubble_chart, title: 'Home'),
          CustomNavItem(icon: Icons.landscape, title: 'Search'),
        ],
        callback: (int i) => pageController.jumpToPage(i),
        initialSelectedIndex: 2,
      ),
    );
  }

  _buildScreen(String message) {
    return Container(
      alignment: Alignment.center,
      child: Text(message, style: TextStyle(fontSize: 30, color: Colors.black)),
    );
  }
}
