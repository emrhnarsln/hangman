import 'package:flutter/material.dart';
import '../hangman_painter.dart';

class HangmanCanvas extends StatelessWidget {
  final int yanlisSayisi;
  final Color renk;

  const HangmanCanvas({
    super.key,
    required this.yanlisSayisi,
    required this.renk,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 280),
      painter: HangmanPainter(yanlisSayisi, renk),
    );
  }
}
