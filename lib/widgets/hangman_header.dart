import 'package:flutter/material.dart';

class HangmanHeader extends StatelessWidget {
  final int kalanHak;
  final VoidCallback onRestart;
  final VoidCallback onBack;
  final List<String> dogruTahminler;
  final List<String> yanlisTahminler;

  const HangmanHeader({
    super.key,
    required this.kalanHak,
    required this.onRestart,
    required this.onBack,
    required this.dogruTahminler,
    required this.yanlisTahminler,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final renk = isDark ? Colors.white : Colors.black;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '✓ ${dogruTahminler.join(', ')}',
                style: TextStyle(color: renk),
              ),
              Text(
                '✗ ${yanlisTahminler.join(', ')}',
                style: TextStyle(color: renk),
              ),
            ],
          ),
        ),
        Text('Hak: $kalanHak', style: TextStyle(color: renk)),
        const SizedBox(width: 12),
        CircleAvatar(
          backgroundColor: Colors.grey.shade400,
          child: IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: onRestart,
          ),
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          backgroundColor: Colors.grey.shade400,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: onBack,
          ),
        ),
      ],
    );
  }
}
