# Laporan Praktikum Pemrograman Mobile
**Nama** : Iqsan Azhar Nuryadi  
**NIM** : H1D024009  
**Shift** : Awal A / Akhir C  
**Praktikum** : Pemrograman Mobile  

---

## 📝 Tugas Pertemuan 1
**Tanggal**: Selasa, 20 Oktober 2026  
**Topik**: Pengenalan Dasar Flutter & Pembuatan Aplikasi Pertama (Hello World)

![Tugas Pertemuan 1](docs/tugas-1.png)

### Kesimpulan Praktikum:
Pada pertemuan pertama, praktikum memberikan pemahaman mendasar mengenai instalasi dan arsitektur framework Flutter berbasis bahasa pemrograman Dart. Mahasiswa memahami struktur berkas proyek Flutter, fungsi titik masuk `main()` dan `runApp()`, konsep *declarative UI* dengan hierarki *widget tree* (`MaterialApp`, `Scaffold`, `AppBar`, dan `Text`), serta keunggulan fitur *Hot Reload* dan *Hot Restart* dalam mempercepat proses *debugging* antarmuka aplikasi mobile.

---

## 📝 Tugas Pertemuan 2
**Tanggal**: Selasa, 27 Oktober 2026  
**Topik**: Tata Letak Antarmuka (*Layouting Widget*) & Formulir Produk

![Tugas Pertemuan 2](docs/tugas-2.png)

### Kesimpulan Praktikum:
Pada pertemuan kedua, praktikum berfokus pada teknik tata letak (*layouting*) dan pengelolaan formulir pada Flutter. Mahasiswa menguasai penggunaan widget struktural linier vertikal (`Column`) dan horizontal (`Row`), penerapan spasi antar elemen, serta perancangan antarmuka formulir interaktif dengan `TextField` dan `TextEditingController`. Selain itu, mahasiswa berhasil mempraktikkan konsep navigasi dasar dan perpindahan data (*passing data*) antar-layar menggunakan `Navigator.push` dan `MaterialPageRoute` menuju halaman rincian produk (`ProdukDetail`).

---

## 📝 Tugas Pertemuan 3
**Tanggal**: Selasa, 3 November 2026  
**Topik**: *Routes*, Navigasi Samping (*Drawer*), dan Manajemen Sesi Lokal (*SharedPreferences*)

![Tugas Pertemuan 3](docs/tugas-3.png)

### Kesimpulan Praktikum:
Pada pertemuan ketiga, praktikum mendalami konsep navigasi multi-halaman berjenjang, pembuatan menu navigasi samping (*Sidemenu Drawer*), dan manajemen persistensi sesi pengguna secara lokal (*local storage*). Mahasiswa berhasil mengimplementasikan sistem autentikasi login dengan validasi input, penyajian umpan balik melalui `AlertDialog`, serta penyimpanan data sesi pengguna secara persisten menggunakan library `shared_preferences`, sehingga status login pengguna tetap tersimpan dan dapat dimuat kembali secara reaktif pada *HomePage*.

---

## 📝 Tugas Pertemuan 4
**Tanggal**: Selasa, 10 November 2026  
**Topik**: Operasi CRUD dengan RESTful API CodeIgniter 4 & Integrasi Frontend Flutter (TokoKita)

![Tugas Pertemuan 4](docs/tugas-4.png)

### Kesimpulan Praktikum:
Pada pertemuan keempat, praktikum menerapkan integrasi *full-stack* antara *backend* RESTful API berbasis framework CodeIgniter 4 (PHP & MySQL pada web server lokal Laragon) dengan *frontend mobile* Flutter TokoKita. Mahasiswa mempraktikkan perancangan skema basis data relasional (`member`, `member_token`, `produk`), implementasi autentikasi aman dengan enkripsi `password_hash` (BCRYPT) dan penerbitan token sesi, serta penyediaan operasi CRUD lengkap (*Create, Read/List, Detail, Update, Delete*). Pada sisi Flutter, antarmuka dirancang secara modular mencakup registrasi akun, login, katalog kartu produk, rincian produk terpilih, serta formulir tambah dan ubah produk dengan penanganan dialog konfirmasi aksi.

---

## 🚀 Panduan Menjalankan Proyek

### 1. Menjalankan Backend API CodeIgniter 4 (Laragon)
- Pastikan Apache dan MySQL di Laragon telah aktif.
- Direktori backend: `C:\laragon\www\toko-api`
- Database: `toko_api` (MySQL port 3306)
- Base URL API: `http://localhost/toko-api/public/`
- Daftar Endpoint:
  - `POST /registrasi` : Registrasi akun pengguna baru
  - `POST /login` : Autentikasi dan penerbitan token sesi
  - `GET /produk` : Menampilkan seluruh daftar produk
  - `POST /produk` : Menambahkan data produk baru
  - `GET /produk/{id}` : Menampilkan rincian data produk
  - `PUT /produk/{id}` : Memperbarui data produk
  - `DELETE /produk/{id}` : Menghapus data produk

### 2. Menjalankan Aplikasi Mobile Flutter (TokoKita)
- Pasang dependensi:
  ```bash
  flutter pub get
  ```
- Jalankan pada web atau emulator:
  ```bash
  flutter run -d chrome
  ```
