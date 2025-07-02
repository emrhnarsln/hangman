import 'package:flutter/material.dart';
import '../utils/theme_helpers.dart';

class HangmanKeyboard extends StatelessWidget {
  final String kategori;
  final Set<String> dogruTahminler;
  final Set<String> yanlisTahminler;
  final void Function(String harf) onHarfSec;

  const HangmanKeyboard({
    super.key,
    required this.kategori,
    required this.dogruTahminler,
    required this.yanlisTahminler,
    required this.onHarfSec,
  });

  @override
  Widget build(BuildContext context) {
    const harfler = 'ABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZ';
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: harfler.split('').map((harf) {
        final kullanildi =
            dogruTahminler.contains(harf.toLowerCase()) ||
            yanlisTahminler.contains(harf.toLowerCase());
        return ElevatedButton(
          onPressed: kullanildi ? null : () => onHarfSec(harf.toLowerCase()),
          style: ElevatedButton.styleFrom(
            backgroundColor: kategoriTemaliRenk(kategori, context),
            foregroundColor: Colors.white,
            disabledBackgroundColor: Colors.grey.shade400,
          ),
          child: Text(harf),
        );
      }).toList(),
    );
  }
}
