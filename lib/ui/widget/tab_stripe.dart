import 'package:flutter/material.dart';

class TabStripe extends StatefulWidget {
  final List<String> titles;
  final Function onTap;
  final double spacing;
  final TextStyle textStyle;
  int selectionIndex;
  final bool disableIndicator;
  final EdgeInsetsGeometry margin, padding, textPadding;

  TabStripe({
    @required this.titles,
    this.onTap,
    this.spacing = 0,
    this.selectionIndex = -1,
    this.disableIndicator = false,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.textPadding = EdgeInsets.zero,
    this.textStyle = const TextStyle(fontSize: 16),
  });

  @override
  _TabStripeState createState() => _TabStripeState();
}

class _TabStripeState extends State<TabStripe> {
  @override
  Widget build(BuildContext context) {
    var tabItems = widget.titles.asMap().entries.map((item) {
      return Container(
        margin: widget.margin,
        padding: widget.padding,
        child: Row(
          children: <Widget>[
            TabStripeItem(
                text: item.value,
                isSelected: item.key == widget.selectionIndex,
                style: widget.textStyle,
                padding: widget.textPadding,
                spacing: widget.spacing,
                disableIndicator: widget.disableIndicator,
                onTap: () {
                  widget.onTap.call(item.key);
                  setState(() {
                    widget.selectionIndex = item.key;
                  });
                }),
            SizedBox(width: widget.spacing)
          ],
        ),
      );
    }).toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: tabItems),
        ),
      ],
    );
  }
}

class TabStripeItem extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry padding, margin;
  final Function onTap;
  final TextStyle style;
  final bool isSelected, disableIndicator;
  final double spacing;

  const TabStripeItem({
    @required this.text,
    this.onTap,
    this.isSelected = false,
    this.spacing = 0,
    this.disableIndicator = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.margin = const EdgeInsets.symmetric(horizontal: 4),
    this.style = const TextStyle(fontSize: 18),
  });

  @override
  Widget build(BuildContext context) {
    var indicator = disableIndicator
        ? SizedBox()
        : Container(
            width: 25,
            height: 2,
            decoration: BoxDecoration(
              color: isSelected ? style.color : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
          );

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(text, style: style.apply(color: isSelected ? style.color : Colors.grey)),
            SizedBox(height: 4),
            indicator,
          ],
        ),
      ),
    );
  }
}

class TabStripeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TabStripe(
          titles: ['item 1', 'item 2', 'item 3', 'item 4'],
          textStyle: TextStyle(fontSize: 20, color: Colors.amber),
          textPadding: EdgeInsets.zero,
          selectionIndex: 0,
          spacing: 32,
          margin: EdgeInsets.symmetric(vertical: 16),
          onTap: (index) {
            print(index);
          },
        ),
      ),
    );
  }
}
