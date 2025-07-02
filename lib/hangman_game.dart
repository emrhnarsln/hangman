class HangmanGame {
  final String kelime;
  final Set<String> dogruTahminler = {};
  final Set<String> yanlisTahminler = {};

  HangmanGame({required this.kelime});

  /// Kelimeyi '_' ve doğru tahminlerle gösterir
  String gizliKelime() {
    return kelime
        .split('')
        .map((harf) {
          return dogruTahminler.contains(harf.toLowerCase()) ? harf : '_';
        })
        .join(' ');
  }

  /// Harf tahmini yapar, doğru/yanlış listesine ekler
  void tahminEt(String harf) {
    harf = harf.toLowerCase();
    if (kelime.contains(harf)) {
      dogruTahminler.add(harf);
    } else {
      yanlisTahminler.add(harf);
    }
  }

  /// Oyunun kazanılıp kazanılmadığını kontrol eder
  bool kazandiMi() {
    for (var harf in kelime.split('')) {
      if (!dogruTahminler.contains(harf.toLowerCase())) {
        return false;
      }
    }
    return true;
  }
}

// Örnek kullanım:
// final oyun = HangmanGame(kelime: 'bilgisayar');
// oyun.tahminEt('b');
// print(oyun.gizliKelime());
