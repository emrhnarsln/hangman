import 'package:flutter/material.dart';

class HangmanResultMessage extends StatelessWidget {
  final bool kazandi;
  final bool kaybetti;
  final String kelime;

  const HangmanResultMessage({
    super.key,
    required this.kazandi,
    required this.kaybetti,
    required this.kelime,
  });

  @override
  Widget build(BuildContext context) {
    if (kazandi) {
      return const Text(
        'Tebrikler, doğru tahmin ettiniz!',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      );
    }

    if (kaybetti) {
      return Text(
        'Üzgünüm, kaybettiniz. Kelime: $kelime',
        style: const TextStyle(fontSize: 20, color: Colors.red),
      );
    }

    return const SizedBox.shrink();
  }
}
