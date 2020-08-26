import 'package:flutter/material.dart';

class CustomNavPainter extends CustomPainter {
  final Paint linePaint, fillPaint;
  final double currentPosition;
  final int totalItem;

  CustomNavPainter({@required this.currentPosition, @required this.totalItem})
      : linePaint = Paint()
          ..style = PaintingStyle.stroke
          ..color = Colors.black
          ..strokeWidth = 3,
        fillPaint = Paint()
          ..style = PaintingStyle.fill
          ..color = Colors.amber;

  final Gradient fadedGradient = LinearGradient(
    colors: <Color>[
      Colors.black.withOpacity(0.05),
      Colors.black.withOpacity(1.0),
      Colors.black.withOpacity(1.0),
      Colors.black.withOpacity(0.05),
    ],
    stops: [
      0.0,
      0.15,
      0.85,
      1.0,
    ],
  );

  @override
  void paint(Canvas canvas, Size size) {
    double radius = size.height * .8;
    double bumpHeight = size.height * .6;
    double itemWidth = size.width / totalItem;
    double mid = itemWidth / 2 + itemWidth * currentPosition;
    double start = mid - radius;
    double end = mid + radius;
    Path line = Path()
      ..moveTo(0, 0)
      ..lineTo(start, 0)
      ..cubicTo(start + itemWidth / 4, 0, start, bumpHeight, mid, bumpHeight)
      ..cubicTo(end, bumpHeight, end - itemWidth / 4, 0, end, 0)
      ..lineTo(size.width, 0);

    Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);
    linePaint..shader = fadedGradient.createShader(rect);
    canvas.drawPath(line.shift(Offset(0, radius / 2)), linePaint);

    Offset circleCenter = Offset(mid, radius / 2);
    canvas.drawCircle(circleCenter, radius * .4, fillPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => this != oldDelegate;
}
