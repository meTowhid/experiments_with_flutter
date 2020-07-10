import 'package:experiments_with_flutter/ui/screens/details.dart';
import 'package:experiments_with_flutter/ui/widget/tab_stripe.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final productData = [
    {'img': 'assets/images/watch.png', 'color': Colors.deepPurple},
    {'img': 'assets/images/watch.png', 'color': Colors.lightGreen},
    {'img': 'assets/images/watch.png', 'color': Colors.deepPurple},
  ];

  final bottomNavIcons = [Icons.navigation, Icons.search, Icons.compare_arrows, Icons.map, Icons.person];

  @override
  Widget build(BuildContext context) {
    const double paddingLeft = 40;

    var menuIcon = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
      child: IconButton(icon: Icon(Icons.short_text), onPressed: () {}),
    );

    var categoriesTitle = Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingLeft),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Categories", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            IconButton(icon: Icon(Icons.search, size: 32), onPressed: () {}),
          ],
        ));

    var categoriesList = Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: TabStripe(
          titles: ['ALL', 'CLASSIC', 'GRAND', 'ORIGINAL'],
          textStyle: TextStyle(color: Colors.amber),
          disableIndicator: true,
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          selectionIndex: 0,
          onTap: (i) {},
        ));

    var productPager = Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        height: 400,
        child: PageView(
            controller: PageController(viewportFraction: .65, initialPage: 1),
            scrollDirection: Axis.horizontal,
            children: productData.map((item) => PageViewItem(item: item)).toList()));

    var bestChoicesTitle = Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingLeft),
      child: Text("Best Choices", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                menuIcon,
                categoriesTitle,
                categoriesList,
                productPager,
                bestChoicesTitle,
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavIcons
            .map((ico) => BottomNavigationBarItem(
                  icon: Icon(ico, color: Colors.black54),
                  title: Text(''),
                ))
            .toList(),
      ),
    );
  }
}

class PageViewItem extends StatelessWidget {
  final Map<String, dynamic> item;

  PageViewItem({this.item});

  @override
  Widget build(BuildContext context) {
    var productTitleStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white);
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    print(MediaQuery.of(context).size);

    var circleRadius = w * .7;
    var backgroundCircle = Container(
        width: circleRadius,
        height: circleRadius,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(circleRadius / 2),
            gradient: LinearGradient(
              colors: [Colors.white.withOpacity(.1), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )));

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: item['color']),
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Details()));
        },
        child: Stack(
          children: <Widget>[
            Positioned(right: -100, top: -50, child: backgroundCircle),
            Padding(padding: const EdgeInsets.all(32), child: Image.asset(item['img'])),
            Positioned(left: 24, bottom: 24, child: Text("Northern\nSky.", style: productTitleStyle)),
          ],
        ),
      ),
    );
  }
}
