import 'package:flutter/material.dart';

Color kategoriArkaPlanRenk(String kategori, BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  switch (kategori) {
    case 'Hayvanlar':
      return isDark ? Colors.green.shade900 : Colors.green.shade50;
    case 'Teknoloji':
      return isDark ? Colors.blueGrey.shade900 : Colors.blue.shade50;
    case 'Renkler':
      return isDark ? Colors.purple.shade900 : Colors.pink.shade50;
    default:
      return isDark ? Colors.grey.shade800 : Colors.grey.shade100;
  }
}

Color kategoriTemaliRenk(String kategori, BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  switch (kategori) {
    case 'Hayvanlar':
      return isDark ? Colors.green.shade400 : Colors.green.shade700;
    case 'Teknoloji':
      return isDark ? Colors.blueGrey.shade200 : Colors.blue.shade600;
    case 'Renkler':
      return isDark ? Colors.purple.shade200 : Colors.pink.shade600;
    default:
      return isDark ? Colors.grey.shade300 : Colors.grey.shade800;
  }
}
