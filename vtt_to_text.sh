#!/bin/bash

# Skrip untuk mengonversi file VTT ke teks biasa
# Penggunaan: ./vtt_to_text.sh input.vtt output.txt
# Atau: ./vtt_to_text.sh input.vtt (akan membuat output dengan nama yang sama tapi ekstensi .txt)

if [ $# -eq 0 ]; then
    echo "Penggunaan: $0 input.vtt [output.txt]"
    echo "Contoh: $0 video.vtt"
    echo "Contoh: $0 video.vtt hasil.txt"
    exit 1
fi

input_file="$1"
output_file="$2"

# Jika output file tidak disebutkan, buat dari nama input file
if [ -z "$output_file" ]; then
    output_file="${input_file%.*}.txt"
fi

# Cek apakah file input ada
if [ ! -f "$input_file" ]; then
    echo "File $input_file tidak ditemukan!"
    exit 1
fi

# Ekstrak hanya teks dari file VTT, hapus header dan timing
# Pola regex: hapus baris yang berisi WEBVTT, NOTE, timestamp (dengan atau tanpa koma), dan nomor urut subtitle
grep -v -E "^WEBVTT$|^NOTE$|^[0-9]{2}:[0-9]{2}:[0-9]{2}|^[0-9]+$" "$input_file" | \
# Hapus baris kosong
sed '/^\s*$/d' | \
# Hapus spasi di awal dan akhir baris
sed 's/^[[:space:]]*//' | \
sed 's/[[:space:]]*$//' | \
# Hapus baris yang hanya berisi spasi
sed '/^\s*$/d' > "$output_file"

echo "Konversi selesai! File output disimpan sebagai: $output_file"