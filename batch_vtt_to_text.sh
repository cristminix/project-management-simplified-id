#!/bin/bash

# Skrip untuk mengonversi semua file VTT dalam direktori saat ini ke teks biasa
# Penggunaan: ./batch_vtt_to_text.sh
# Atau: ./batch_vtt_to_text.sh path/to/directory

if [ $# -eq 0 ]; then
    search_dir="."
else
    search_dir="$1"
fi

# Cek apakah direktori ada
if [ ! -d "$search_dir" ]; then
    echo "Direktori $search_dir tidak ditemukan!"
    exit 1
fi

echo "Mencari file VTT di direktori: $search_dir"
vtt_files=$(find "$search_dir" -name "*.vtt" -type f)

if [ -z "$vtt_files" ]; then
    echo "Tidak ada file VTT ditemukan di direktori $search_dir"
    exit 1
fi

echo "Ditemukan file VTT berikut:"
echo "$vtt_files"
echo

count=0
for vtt_file in $vtt_files; do
    txt_file="${vtt_file%.*}.txt"
    echo "Mengonversi: $vtt_file -> $txt_file"
    
    # Ekstrak hanya teks dari file VTT, hapus header dan timing
    grep -v -E "^WEBVTT$|^NOTE$|^[0-9]{2}:[0-9]{2}:[0-9]{2}|^[0-9]+$" "$vtt_file" | \
    # Hapus baris kosong
    sed '/^\s*$/d' | \
    # Hapus spasi di awal dan akhir baris
    sed 's/^[[:space:]]*//' | \
    sed 's/[[:space:]]*$//' | \
    # Hapus baris yang hanya berisi spasi
    sed '/^\s*$/d' > "$txt_file"
    
    ((count++))
done

echo
echo "Konversi selesai! $count file VTT telah dikonversi ke teks."