import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';

class KotDottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = whiteColor
      ..strokeWidth = 0.5 
      ..style = PaintingStyle.stroke;

    const double dashWidth = 4;
    const double dashSpace = 4; 
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height),
        Offset(startX + dashWidth, size.height),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}