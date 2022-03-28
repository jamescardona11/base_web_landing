import 'package:base_web_landing/config/values/values.dart';
import 'package:flutter/material.dart';

class PointsDecorationWidget extends StatelessWidget {
  const PointsDecorationWidget({
    Key? key,
    this.quantityX = 2,
    this.quantityY = 2,
    this.padding = true,
    this.radius = 6,
    this.delta = 2,
    this.color = kPrimaryColor,
    this.colors,
  }) : super(key: key);

  final int quantityX;
  final int quantityY;
  final bool padding;
  final double radius;
  final double delta;
  final Color color;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    final sizeX = delta * (quantityX - 1) + 2 * radius * quantityX;
    final sizeY = delta * (quantityY - 1) + 2 * radius * quantityY;

    return Padding(
      padding: padding ? const EdgeInsets.all(8.0) : EdgeInsets.zero,
      child: SizedBox.fromSize(
        size: Size(sizeX, sizeY),
        child: CustomPaint(
          painter: _PointsPainter(
            quantityX: quantityX,
            quantityY: quantityY,
            delta: delta,
            radius: radius,
            color: color,
            colors: colors,
          ),
        ),
      ),
    );
  }
}

class _PointsPainter extends CustomPainter {
  final int quantityX;
  final int quantityY;
  final double radius;
  final double delta;
  final Color color;
  final List<Color>? colors;

  _PointsPainter({
    required this.quantityX,
    required this.quantityY,
    required this.radius,
    required this.delta,
    required this.color,
    this.colors = const [],
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final quantity = quantityX * quantityY;

    int x = 0;
    int y = 0;

    for (int i = 0; i < quantity; i++) {
      if (colors?.isNotEmpty == true) {
        paint.color = colors![i];
      }

      final centerX = radius + (delta + 2 * radius) * x;
      final centerY = radius + (delta + 2 * radius) * y;

      final offset = Offset(centerX, centerY);
      canvas.drawCircle(offset, radius, paint);
      x++;

      if (x == quantityX) {
        y++;
        x = 0;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
