import 'package:flutter/material.dart';

class HangmanPainter extends CustomPainter {
  final int wrongGuesses;
  final Color cizgiRenk;

  HangmanPainter(this.wrongGuesses, this.cizgiRenk);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = cizgiRenk
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final width = size.width;
    final height = size.height;

    // Yükseklik oranına göre çalışacak şekilde ayarlıyoruz
    final double topY = 50;
    final double baseY = height * 0.95;
    final double centerX = width * 0.5;

    // 1. Zemin
    canvas.drawLine(Offset(20, baseY), Offset(width - 20, baseY), paint);

    // 2. Direk
    canvas.drawLine(Offset(50, baseY), Offset(50, topY), paint);
    canvas.drawLine(Offset(50, topY), Offset(centerX, topY), paint);
    canvas.drawLine(Offset(centerX, topY), Offset(centerX, topY + 50), paint);

    if (wrongGuesses > 0) {
      final headPaint = Paint()
        ..color = cizgiRenk
        ..strokeWidth = paint.strokeWidth
        ..style = PaintingStyle.stroke;
      canvas.drawCircle(Offset(centerX, topY + 75), 20, headPaint);
    }
    if (wrongGuesses > 1) {
      // Gövde
      canvas.drawLine(
        Offset(centerX, topY + 95),
        Offset(centerX, topY + 160),
        paint,
      );
    }
    if (wrongGuesses > 2) {
      // Sol kol
      canvas.drawLine(
        Offset(centerX, topY + 110),
        Offset(centerX - 30, topY + 140),
        paint,
      );
    }
    if (wrongGuesses > 3) {
      // Sağ kol
      canvas.drawLine(
        Offset(centerX, topY + 110),
        Offset(centerX + 30, topY + 140),
        paint,
      );
    }
    if (wrongGuesses > 4) {
      // Sol bacak
      canvas.drawLine(
        Offset(centerX, topY + 160),
        Offset(centerX - 25, topY + 200),
        paint,
      );
    }
    if (wrongGuesses > 5) {
      // Sağ bacak
      canvas.drawLine(
        Offset(centerX, topY + 160),
        Offset(centerX + 25, topY + 200),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant HangmanPainter oldDelegate) {
    return oldDelegate.wrongGuesses != wrongGuesses;
  }
}
