🎮 Adam Asmaca (Hangman) - Flutter
Bu proje, klasik Adam Asmaca oyununu modern Flutter UI öğeleriyle geliştirmenizi sağlar. Uygulama içinde kategori ve zorluk seçimi, tema desteği (açık/koyu), özel çizim ile adam figürü, modern klavye bileşeni ve kullanıcı dostu arayüz gibi birçok özelliği barındırır.

🧩 Özellikler
🎨 Tema Desteği: Açık ve koyu tema arasında geçiş (uygulama içinden).

📚 Kategori & Zorluk Seçimi: Ana ekrandan kullanıcı tarafından belirlenebilir.

🧠 Dinamik Kelime Havuzu: kelimeler.dart üzerinden kolayca güncellenebilir.

✍️ Modern UI: Klavye, çubuk ve adam çizimi CustomPainter ile özelleştirildi.

🔄 Yeniden Başlat & Geri Dön: Üstte amblemli butonlar ile erişilebilir.

📂 Klasör Yapısı

lib/
├── screens/
│ └── hangman_screen.dart
├── utils/
│ └── theme_helpers.dart
├── widgets/
│ ├── hangman_canvas.dart
│ ├── hangman_header.dart
│ ├── hangman_keyboard.dart
│ ├── hangman_result_message.dart
├── main.dart
├── home_page.dart
├── hangman_game.dart
├── kelimeler.dart
screenshots/
├── home.png
├── game_light.png
├── game_dark.png

## 📸 Ekran Görüntüleri

| Ana Ekran | Oyun Ekranı (Açık Tema) | Oyun Ekranı (Karanlık Tema) |
|-----------|--------------------------|------------------------------|
| ![home](screenshots/home.png) | ![light](screenshots/game_light.png) | ![dark](screenshots/game_dark.png) |
