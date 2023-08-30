import 'package:flutter/material.dart';

class SquareDecoration extends Decoration {
  final Size size;
  final Color color;
  final TextSpan textSpan;

  SquareDecoration({
    required this.size,
    required this.color,
    required this.textSpan,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _SquarePainter(this, size, color, textSpan);
  }
}

class _SquarePainter extends BoxPainter {
  final SquareDecoration decorator;
  late final Paint painter;
  final Size size;
  final TextSpan textSpan;

  _SquarePainter(this.decorator, this.size, Color color, this.textSpan) {
    painter = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // var size = configuration.size!;

    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, painter);

    TextPainter textPainter = TextPainter(text: textSpan, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final xCenter = (size.width - textPainter.width) / 2;
    final yCenter = (size.height - textPainter.height) / 2;
    final offset = Offset(xCenter, yCenter);

    textPainter.paint(canvas, offset);
  }
}
