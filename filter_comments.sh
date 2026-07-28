#!/bin/bash

# Skrip shell untuk memfilter baris dalam file teks yang TIDAK dimulai dengan "#"
# Nama: filter_comments.sh
# Deskripsi: Memfilter dan menampilkan baris-baris dalam file teks yang TIDAK dimulai dengan karakter "#"

# Memeriksa apakah argumen file disediakan
if [ $# -eq 0 ]; then
    echo "Penggunaan: $0 <nama_file>"
    echo "Deskripsi: Skrip ini memfilter baris-baris dalam file teks yang TIDAK dimulai dengan karakter '#'"
    exit 1
fi

# Memeriksa apakah file ada
if [ ! -f "$1" ]; then
    echo "Error: File '$1' tidak ditemukan!"
    exit 1
fi

# Membaca file dan memfilter baris yang TIDAK dimulai dengan "#"
grep -v '^#' "$1"