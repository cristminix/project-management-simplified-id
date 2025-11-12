# Skrip Konversi VTT ke Teks

Kumpulan skrip shell untuk mengonversi file VTT (Video Text Tracks) ke format teks biasa.

## File yang Disertakan

1. `vtt_to_text.sh` - Skrip untuk mengonversi satu file VTT ke file teks
2. `batch_vtt_to_text.sh` - Skrip untuk mengonversi semua file VTT dalam direktori

## Persyaratan

- Sistem Unix/Linux/macOS dengan shell bash
- Utilitas standar: `grep`, `sed`

## Cara Menggunakan

### vtt_to_text.sh

Untuk mengonversi satu file VTT:

```bash
./vtt_to_text.sh input.vtt
```

Ini akan membuat file output dengan nama `input.txt`.

Atau untuk menentukan nama file output sendiri:

```bash
./vtt_to_text.sh input.vtt output.txt
```

### batch_vtt_to_text.sh

Untuk mengonversi semua file VTT dalam direktori saat ini:

```bash
./batch_vtt_to_text.sh
```

Atau untuk mengonversi semua file VTT dalam direktori tertentu:

```bash
./batch_vtt_to_text.sh path/to/directory
```

## Fitur

- Menghapus header WEBVTT dan informasi timing
- Menghapus nomor urut subtitle
- Membersihkan spasi berlebih
- Menjaga teks asli dalam format yang mudah dibaca

## Contoh

File VTT dengan isi:

```
WEBVTT

1
00:00:01.000 --> 00:00:04.000
Contoh teks pertama

2
00:00:05.000 --> 00:00:08.000
Contoh teks kedua
```

Akan dikonversi menjadi file teks:

```
Contoh teks pertama
Contoh teks kedua
```
