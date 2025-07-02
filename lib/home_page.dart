import 'package:flutter/material.dart';
import 'screens/hangman_screen.dart';

class HomePage extends StatefulWidget {
  final void Function(bool isDark) onThemeToggle;
  final bool isDarkMode;

  const HomePage({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> kategoriler = ['Teknoloji', 'Hayvanlar', 'Renkler'];
  final List<String> zorluklar = ['Kolay', 'Orta', 'Zor'];

  String? seciliKategori;
  String? seciliZorluk;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adam Asmaca'),
        centerTitle: true,
        actions: [
          Row(
            children: [
              const Icon(Icons.light_mode),
              Switch(value: widget.isDarkMode, onChanged: widget.onThemeToggle),
              const Icon(Icons.dark_mode),
              const SizedBox(width: 12),
            ],
          ),
        ],
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Kategori Seç',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: seciliKategori,
                  items: kategoriler
                      .map((k) => DropdownMenuItem(value: k, child: Text(k)))
                      .toList(),
                  onChanged: (val) => setState(() => seciliKategori = val),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                  hint: const Text('Kategori seçiniz'),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Zorluk Seç',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: seciliZorluk,
                  items: zorluklar
                      .map((z) => DropdownMenuItem(value: z, child: Text(z)))
                      .toList(),
                  onChanged: (val) => setState(() => seciliZorluk = val),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                  hint: const Text('Zorluk seçiniz'),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (seciliKategori != null && seciliZorluk != null)
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HangmanScreen(
                                  kategori: seciliKategori!,
                                  zorluk: seciliZorluk!,
                                ),
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Oyuna Başla',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
