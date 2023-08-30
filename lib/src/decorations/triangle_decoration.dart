import 'dart:math';

import 'package:flutter/material.dart';

// const double _CORNER_RADIUS = 4;

class TriangleDecoration extends Decoration {
  final Size size;
  final Color color;
  final TextSpan textSpan;

  TriangleDecoration({
    required this.size,
    required this.color,
    required this.textSpan,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TrianglePainter(this, size, color, textSpan);
  }
}

class _TrianglePainter extends BoxPainter {
  final TriangleDecoration decorator;
  late final Paint painter;
  final Size size;
  final TextSpan textSpan;

  _TrianglePainter(this.decorator, this.size, Color color, this.textSpan) {
    painter = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    var path = Path();

    path.moveTo(offset.dx, offset.dy);
    path.lineTo(offset.dx, offset.dy + size.height);
    path.lineTo(offset.dx + size.width, offset.dy);
    path.close();

    canvas.drawPath(path, painter);

    drawText(canvas, -(pi / 4), offset);
  }

  void drawText(Canvas canvas, double angle, Offset screenOffset) {
    TextPainter textPainter = TextPainter(text: textSpan, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final xCenter = ((size.width / 2) - (textPainter.width / 1.2)) / 2;
    final yCenter = ((size.height / 2) - (textPainter.height / 1.2)) / 2;
    final offset = Offset(screenOffset.dx + xCenter, screenOffset.dy + yCenter);

    canvas.save();
    final pivot = textPainter.size.center(offset);

    canvas.translate(pivot.dx, pivot.dy);
    canvas.rotate(angle);
    canvas.translate(-pivot.dx, -pivot.dy);

    textPainter.paint(canvas, offset);
    canvas.restore();
  }
}

// class TriangleDecoration extends Decoration {
//   final Size size;
//   final Color color;
//   final TextSpan textSpan;

//   TriangleDecoration({
//     required this.size,
//     required this.color,
//     required this.textSpan,
//   });

//   @override
//   BoxPainter createBoxPainter([VoidCallback? onChanged]) {
//     return _TrianglePainter(this, size, color, textSpan);
//   }
// }

// class _TrianglePainter extends BoxPainter {
//   final TriangleDecoration decorator;
//   late final Paint painter;
//   final Size size;
//   final TextSpan textSpan;

//   _TrianglePainter(this.decorator, this.size, Color color, this.textSpan) {
//     painter = Paint()
//       ..color = color
//       ..style = PaintingStyle.fill;
//   }

//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
//     paint2(canvas, offset, size, textSpan);
//   }

//   void paint2(Canvas canvas, Offset offset, Size size, TextSpan textSpan) {
//     var badgeSize = size.height;
//     canvas.save();
//     canvas.translate(offset.dx + size.width - badgeSize, offset.dy);
//     canvas.drawPath(buildBadgePath(badgeSize), painter);
//     // draw text
//     final hyp = sqrt(badgeSize * badgeSize + badgeSize * badgeSize);
//     final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr, textAlign: TextAlign.center);
//     textPainter.layout(minWidth: hyp, maxWidth: hyp);
//     badgeSize = textPainter.size.height;
//     size = Size(textPainter.size.height, textPainter.size.height);
//     final halfHeight = textPainter.size.height / 2;
//     final v = sqrt(halfHeight * halfHeight + halfHeight * halfHeight) + 1;
//     canvas.translate(v, -v);
//     canvas.rotate(0.785398); // 45 degrees
//     textPainter.paint(canvas, Offset.zero);
//     canvas.restore();
//   }

//   Path buildBadgePath(double badgeSize) => Path.combine(
//       PathOperation.difference,
//       Path()..addRRect(RRect.fromLTRBAndCorners(0, 0, badgeSize, badgeSize, topRight: Radius.circular(_CORNER_RADIUS))),
//       Path()
//         ..lineTo(0, badgeSize)
//         ..lineTo(badgeSize, badgeSize)
//         ..close());
// }
