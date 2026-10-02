# Nihongo Master 🇯🇵
Aplikasi Flutter offline untuk belajar Kotoba + Bunpō N5–N3.

## Isi
- Kotoba N5–N3 dengan kanji, kana, romaji, arti dan contoh.
- Bunpō N5–N3 dengan pola, rumus, penjelasan dan contoh.
- Pencarian + filter level.
- Quiz Kotoba.
- Progress tersimpan lokal.

## Build
```bash
flutter pub get
flutter run
flutter build apk --release
```

Jika folder Android dari ZIP tidak lengkap karena perbedaan versi Flutter, jalankan `flutter create .` di folder project ini, lalu pertahankan `lib/`, `assets/`, dan `pubspec.yaml`.
