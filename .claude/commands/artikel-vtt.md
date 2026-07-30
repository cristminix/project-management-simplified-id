---
description: Ubah satu file VTT/TXT transkrip video menjadi artikel Markdown berbahasa Indonesia di transkrip/
argument-hint: <file .vtt atau .txt> [judul opsional]
allowed-tools: Bash, Read, Write, Glob, Grep
---

Buat artikel berbahasa Indonesia yang lengkap dari transkrip video berikut, lalu simpan ke `transkrip/`.

File sumber: `$1`
Judul yang diminta pengguna (opsional, boleh kosong): $2

## Langkah

### 1. Siapkan teks sumber

- Jika `$1` berekstensi `.vtt`, konversi dulu ke teks bersih:
  ```bash
  bash vtt_to_text.sh "$1"
  ```
  Skrip ini menghasilkan file `.txt` dengan nama yang sama (menghapus header WEBVTT, nomor urut, dan timestamp).
- Jika `$1` sudah berekstensi `.txt`, pakai langsung.
- Baca file `.txt` tersebut sepenuhnya sebelum menulis apa pun.

### 2. Tentukan nama file tujuan

- Nama file artikel = basename file sumber **tanpa** sufiks `-720` dan **tanpa** ekstensi, ditambah `.md`.
  Contoh: `09-choose-the-level-of-granularity-720.vtt` → `transkrip/09-choose-the-level-of-granularity.md`.
- **Pertahankan nomor indeks dari file sumber** — penomoran di `transkrip/` mengikuti penomoran file sumber di root proyek.
- Sebelum menulis, cek apakah artikel dengan materi yang sama sudah ada di `transkrip/` (termasuk dengan nomor indeks lama, mis. `08-...` untuk sumber `09-...`). Jika ada:
  - jangan buat duplikat;
  - `git mv` file lama ke nama baru yang benar, lalu tulis ulang isinya;
  - laporkan hal ini ke pengguna.

### 3. Tulis artikelnya

Bahasa dan gaya:

- Bahasa Indonesia yang natural dan mengalir — **artikel**, bukan terjemahan harfiah per baris transkrip.
- Sapa pembaca dengan "Anda". Nada instruksional dan praktis, seperti materi kursus manajemen proyek.
- Pertahankan **semua** contoh, analogi, angka, dan istilah kunci dari transkrip (mis. contoh dapur, parit 10 mil, teknisi listrik). Jangan mengarang contoh baru dan jangan menambahkan konsep yang tidak ada di transkrip.
- Istilah asing yang penting ditulis dalam bahasa Indonesia dengan padanan aslinya dalam kurung atau *italic*, mis. **granularitas**, tumpang tindih (*overlap*), *ongoing*.
- Jangan menyisakan kalimat lisan/pengisi dari transkrip ("Here it is on the screen", sapaan pembuka/penutup video).

Struktur:

- `# Judul` — satu H1 di baris pertama, ringkas dan deskriptif (pakai `$2` bila pengguna memberikannya).
- Beberapa paragraf pengantar yang menjelaskan konteks dan mengapa topik ini penting.
- Bagian isi dengan heading `##` untuk tiap poin/tahap utama dalam transkrip.
- Gunakan daftar berpoin/bernomor untuk enumerasi, **bold** untuk istilah kunci, dan blockquote `>` untuk poin "Kuncinya:" / "Solusinya:".
- Tutup dengan bagian `## Kesimpulan` yang merangkum inti materi.
- Panjang wajar: cakup seluruh isi transkrip tanpa memadatkan berlebihan.

### 4. Rapikan

- Pindahkan file `.txt` sumber ke `transkrip/finished/` dengan nama tanpa sufiks `-720` (pola yang dipakai file-file sebelumnya).
- Jangan commit kecuali pengguna memintanya.

### 5. Laporkan

Sebutkan path file artikel yang dibuat, ringkasan singkat strukturnya, dan setiap keputusan atau ketidakkonsistenan penomoran yang Anda temukan.
