import 'package:flutter/material.dart';
import '../hangman_game.dart';
import '../kelimeler.dart';
import '../utils/theme_helpers.dart';
import '../widgets/hangman_header.dart';
import '../widgets/hangman_canvas.dart';
import '../widgets/hangman_keyboard.dart';
import '../widgets/hangman_result_message.dart';

class HangmanScreen extends StatefulWidget {
  final String kategori;
  final String zorluk;

  const HangmanScreen({required this.kategori, required this.zorluk, Key? key})
    : super(key: key);

  @override
  State<HangmanScreen> createState() => _HangmanScreenState();
}

class _HangmanScreenState extends State<HangmanScreen> {
  late HangmanGame oyun;
  final int maxYanlis = 6;

  @override
  void initState() {
    super.initState();
    oyunuYenidenBaslat();
  }

  void harfTahminEt(String harf) {
    if (oyun.dogruTahminler.contains(harf) ||
        oyun.yanlisTahminler.contains(harf))
      return;

    setState(() {
      oyun.tahminEt(harf);
    });
  }

  void oyunuYenidenBaslat() {
    final kelimeler =
        kelimeHavuzu[widget.kategori]?[widget.zorluk] ?? ['default'];
    final rastgeleKelime = (kelimeler..shuffle()).first;
    setState(() {
      oyun = HangmanGame(kelime: rastgeleKelime);
    });
  }

  void geriDon() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    final kelimeGizli = oyun.gizliKelime();
    final kazandi = oyun.kazandiMi();
    final kaybetti = oyun.yanlisTahminler.length >= maxYanlis;
    final kalanHak = maxYanlis - oyun.yanlisTahminler.length;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final kalanHakRenk = kalanHak <= 2
        ? Colors.red
        : (isDark ? Colors.white : Colors.black);

    return Scaffold(
      appBar: AppBar(title: Text('${widget.kategori} - ${widget.zorluk}')),
      backgroundColor: kategoriArkaPlanRenk(widget.kategori, context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HangmanHeader(
                kalanHak: kalanHak,
                onRestart: oyunuYenidenBaslat,
                onBack: geriDon,
                dogruTahminler: oyun.dogruTahminler.toList(),
                yanlisTahminler: oyun.yanlisTahminler.toList(),
              ),
              const SizedBox(height: 12),
              HangmanCanvas(
                yanlisSayisi: oyun.yanlisTahminler.length,
                renk: kalanHakRenk,
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  kelimeGizli,
                  style: const TextStyle(fontSize: 32, letterSpacing: 4),
                ),
              ),
              const SizedBox(height: 24),
              if (!kazandi && !kaybetti) ...[
                const Text(
                  'Bir harf seç:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                HangmanKeyboard(
                  kategori: widget.kategori,
                  dogruTahminler: oyun.dogruTahminler,
                  yanlisTahminler: oyun.yanlisTahminler,
                  onHarfSec: harfTahminEt,
                ),
              ],
              const SizedBox(height: 24),
              Center(
                child: HangmanResultMessage(
                  kazandi: kazandi,
                  kaybetti: kaybetti,
                  kelime: oyun.kelime,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
