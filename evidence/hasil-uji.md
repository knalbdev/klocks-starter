# TODO-F12 — Hasil pengujian Firebase

Nama peserta:
Tanggal/perangkat:
Project ID latihan (opsional; jangan tulis password):

Isi status **Lulus / Gagal / Belum diuji**, hasil aktual, dan bukti. Hindari data pribadi.

| Kasus | Status | Hasil aktual / bukti |
| --- | --- | --- |
| F01 konfigurasi dan inisialisasi | Belum diuji | |
| F02 dua akun dengan UID berbeda | Belum diuji | |
| F03 login benar dan salah | Belum diuji | |
| F04 sesi setelah restart | Belum diuji | |
| F05 logout Batal dan Ya | Belum diuji | |
| F06 own / akun lain / anonymous | Belum diuji | |
| F07 metadata realtime, max 60 | Belum diuji | |
| F08 batch valid, tiga dokumen konsisten | Belum diuji | |
| F08 kiriman kedua ditolak server | Belum diuji | |
| F08 tanpa foto / bytes 0 / >100 KB ditolak server | Belum diuji | |
| F08 timestamp client / update metadata ditolak | Belum diuji | |
| F08 penolakan tidak menyisakan dokumen parsial | Belum diuji | |
| F09 foto sesuai record, dibaca saat diketuk | Belum diuji | |
| F10 profil simpan / ganti / batal / restart / A-B | Belum diuji | |
| F11 dua exemption bytes di Console | Belum diuji | |
| flutter analyze dan flutter test | Belum diuji | |

## Penjelasan singkat

1. Mengapa UID dipakai pada path pemilik?
2. Mengapa metadata memakai snapshots dan satu foto memakai get?
3. Mengapa tiga dokumen harus dalam satu batch?
4. Apa peran serverTimestamp dan getAfter?
5. Apa yang belum dapat dibuktikan tes otomatis bawaan?

## Kendala yang belum selesai

Tulis kondisi sebenarnya. Jangan menulis Lulus hanya karena UI tidak menampilkan error.
