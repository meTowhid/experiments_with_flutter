import 'package:experiments_with_flutter/ui/widget/tab_stripe.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    print(MediaQuery.of(context).size);

    const double paddingLeft = 40;
    const double addToCartBtnSize = 60;
    const double bottomSheetCornerRadius = paddingLeft;

    var appBarIcons = Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingLeft - 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.short_text, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed: () {}),
        ],
      ),
    );

    var productTitle = Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: paddingLeft),
        child: RichText(
          text: TextSpan(children: [
            TextSpan(text: "Classic", style: TextStyle(fontSize: 26)),
            TextSpan(text: "\nNorthern\nSky.", style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold)),
          ]),
        ));

    var productColor = Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingLeft),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("COLORS", style: TextStyle(color: Colors.white38)),
        DropdownButtonHideUnderline(
          child: DropdownButton(
              style: TextStyle(fontSize: 22),
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
              items: ['Dark', 'Light'].map((e) => DropdownMenuItem(child: Text(e))).toList(),
              onChanged: (_) {}),
        ),
      ]),
    );

    var productPrice = Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingLeft),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("COST", style: TextStyle(color: Colors.white38)),
        SizedBox(height: 8),
        Text('\$329.00', style: TextStyle(color: Colors.white, fontSize: 22)),
      ]),
    );

    var watchImage = Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(width: w * .60, child: Image.asset('assets/images/watch.png')),
    );

    var productColorAndPrice = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[productColor, SizedBox(height: 16), productPrice],
    );

    var bottomSheet = Container(
      height: h * .3,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bottomSheetCornerRadius),
          topRight: Radius.circular(bottomSheetCornerRadius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(),
          TabStripe(
            titles: ['Details', 'Description'],
            onTap: (i) {},
            textStyle: TextStyle(fontSize: 20, color: Colors.amber),
            margin: EdgeInsets.symmetric(vertical: 16),
            textPadding: EdgeInsets.zero,
            selectionIndex: 0,
            spacing: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _watchInfo('36mm', 'Case\ndiameter'),
              _watchInfo('14mm', 'Strap\nwidth'),
              _watchInfo('Wood', 'Strap\nMaterial'),
              _watchInfo('Miyota', 'Enggine\nMovement'),
            ],
          ),
          SizedBox(height: 24),
        ],
      ),
    );

    var addToCartBtn = Container(
      width: addToCartBtnSize,
      height: addToCartBtnSize,
      decoration: BoxDecoration(
        color: Colors.amber,
        boxShadow: [BoxShadow(offset: Offset(0, 25), blurRadius: 25, spreadRadius: -10, color: Colors.grey.withOpacity(.3))],
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(icon: Icon(Icons.add, color: Colors.white), onPressed: () {}),
    );

    var circleRadius = h * .7;
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

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(right: -220, top: -150, child: backgroundCircle),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[appBarIcons, productTitle],
            ),
            Align(alignment: Alignment.bottomCenter, child: bottomSheet),
            Positioned(bottom: h * .3 - addToCartBtnSize / 2, left: paddingLeft, child: addToCartBtn),
            Align(alignment: Alignment.centerLeft, child: productColorAndPrice),
            Align(alignment: Alignment.centerRight, child: watchImage),
          ],
        ),
      ),
    );
  }

  _watchInfo(title, subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: TextStyle(fontSize: 22)),
        SizedBox(height: 8),
        Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
