# 📘 TAPATUPA - Dokumentasi Konsep Proyek

**Versi:** 1.0  
**Tanggal:** 2 April 2026  
**Status:** ✅ Complete Concept Documentation

---

## 📖 Daftar Isi

1. [Pendahuluan & Deskripsi Proyek](#pendahuluan--deskripsi-proyek)
2. [Tujuan & Manfaat Sistem](#tujuan--manfaat-sistem)
3. [Teknologi & Arsitektur](#teknologi--arsitektur)
4. [2 Role Utama & Ruang Lingkup](#2-role-utama--ruang-lingkup)
5. [Fitur User (Masyarakat)](#fitur-user-masyarakat)
6. [Fitur Admin (Petugas)](#fitur-admin-petugas)
7. [User Journey & Workflow](#user-journey--workflow)
8. [Data & Entitas Utama](#data--entitas-utama)

---

## 📋 Pendahuluan & Deskripsi Proyek

### Apa Itu TAPATUPA?

**TAPATUPA** adalah singkatan dari **"Tata Parkir Terpadu Utama Pelayanan Administrasi"**, sebuah aplikasi mobile berbasis teknologi Flutter yang dirancang untuk memudahkan sistem manajemen penyewaan aset pemerintah (dalam konteks ini adalah ruang parkir atau ruang publik) secara online.

Aplikasi ini menghubungkan **masyarakat** yang ingin menyewa aset dengan **petugas pemerintah** yang mengelola aset dan transaksi pembayaran.

### Latar Belakang Masalah

- Sistem tradisional/manual untuk sewa aset pemerintah memakan waktu lama
- Proses administratif yang rumit dan tidak transparan
- Pembayaran offline menyulitkan tracking dan rekonsiliasi
- Tidak ada sistem monitoring realtime untuk petugas
- Sulit untuk user mendapat informasi tatarik dan ketersediaan aset

### Solusi TAPATUPA

TAPATUPA menyediakan platform terintegrasi yang memungkinkan:
- **User** dapat dengan mudah melihat aset, tarif, mengajukan permohonan, dan melakukan pembayaran online
- **Admin** dapat memonitor semua permohonan, perjanjian, dan pembayaran secara realtime
- Sistem otomatis yang mengurangi interaksi manual dan mempercepat proses

---

## 🎯 Tujuan & Manfaat Sistem

### Tujuan Utama

| Tujuan | Penjelasan |
|--------|-----------|
| **Efisiensi Administratif** | Mengotomasi proses manual sewaan aset sehingga lebih cepat dan akurat |
| **Transparansi** | User dapat melihat status permohonan real-time, admin dapat monitor semua transaksi |
| **Digitalisasi Pembayaran** | Menerapkan sistem pembayaran digital (Virtual Account) untuk keamanan dan tracking |
| **Meningkatkan PAD** | Memudahkan masyarakat untuk menyewa sehingga revenue pemerintah meningkat |
| **Data Terpusat** | Semua data sewa, pembayaran, dan perjanjian tersimpan dalam satu sistem |

### Manfaat untuk User

- ✅ Mudah melihat aset dan tarif kapan saja
- ✅ Proses permohonan cepat via aplikasi
- ✅ Pembayaran aman dengan Virtual Account
- ✅ Dapat melacak status permohonan secara realtime
- ✅ Riwayat pembayaran dan perjanjian tersimpan dalam aplikasi

### Manfaat untuk Admin/Petugas

- ✅ Dashboard monitoring semua permohonan dari satu tempat
- ✅ Automation: status permohonan update otomatis
- ✅ Tracking pembayaran real-time
- ✅ Laporan data dapat diakses dengan mudah
- ✅ Mengurangi beban kerja manual

---

## 🛠️ Teknologi & Arsitektur

### Tech Stack

| Aspek | Teknologi |
|-------|-----------|
| **Frontend** | Flutter (Mobile) |
| **Backend** | REST API (Node.js/Django/Laravel) |
| **Database** | Relational Database (MySQL/PostgreSQL) |
| **Payment Gateway** | Midtrans/Payment Gateway untuk Virtual Account |
| **Banking Integration** | Koneksi ke Bank untuk verifikasi VA |
| **Authentication** | JWT Token-based Authentication |

### Arsitektur Sistem

```
┌─────────────────────────────────────────────────────────┐
│                    USER DEVICES                          │
│               (Mobile Flutter App)                      │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │  User Biasa  │  │   Admin/     │  │   External   │  │
│  │              │  │   Petugas    │  │   Systems    │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  │
└─────────────────────────────────────────────────────────┘
                ↕ HTTPS/REST API
┌─────────────────────────────────────────────────────────┐
│              BACKEND SERVER & SERVICES                  │
│  ┌─────────────────────────────────────────────────────┐│
│  │     REST API (Authentication, Business Logic)      ││
│  └─────────────────────────────────────────────────────┘│
│  ┌─────────────────────────────────────────────────────┐│
│  │     Database (User, Assets, Requests, Payments)     ││
│  └─────────────────────────────────────────────────────┘│
│  ┌─────────────────────────────────────────────────────┐│
│  │     Payment Gateway Integration (Midtrans)          ││
│  └─────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────┘
                ↕ Integration
┌─────────────────────────────────────────────────────────┐
│           EXTERNAL SYSTEMS & PARTNERS                   │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │ Bank Server  │  │   Payment    │  │   Notif      │  │
│  │              │  │   Gateway    │  │   Service    │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  │
└─────────────────────────────────────────────────────────┘
```

---

## 🎭 2 Role Utama & Ruang Lingkup

### 1️⃣ USER / MASYARAKAT

**Siapa:** Masyarakat umum yang ingin menyewa aset pemerintah (ruang parkir, ruang meeting, dll)

**Ruang Lingkup Akses:**
- Melihat aset yang tersedia
- Melihat tarif sewa
- Membuat permohonan sewa
- Melihat status permohonan
- Melihat perjanjian dan tagihan
- Melakukan pembayaran
- Melihat riwayat pembayaran
- Mengelola profil pribadi

**Batasan (Tidak Bisa Akses):**
- ❌ Dashboard admin
- ❌ Approve/reject permohonan (hanya admin)
- ❌ Generate tagihan (hanya admin)
- ❌ Lihat data user lain
- ❌ Ubah tarif atau data aset
- ❌ Monitoring pembayaran semua user

---

### 2️⃣ ADMIN / PETUGAS LAPANGAN

**Siapa:** Petugas pemerintah yang mengelola aset, permohonan, dan pembayaran

**Ruang Lingkup Akses:**
- Monitoring dashboard
- Melihat semua permohonan dari semua user
- Approve/reject permohonan
- Generate perjanjian dan tagihan
- Monitoring pembayaran semua user
- Melihat laporan dan data statistik
- Manage aset dan tarif
- Lihat riwayat transaksi semua user

**Batasan (Tidak Bisa Akses):**
- ❌ Edit data user (kecuali admin data)
- ❌ Hapus permohonan user (hanya archive)
- ❌ Ubah pembayaran yang sudah tercatat
- ❌ Lihat password user
- ❌ Akses fitur super admin lainnya

---

## 👥 FITUR USER (MASYARAKAT)

Fitur user adalah semua yang bisa dilakukan oleh masyarakat/pengguna biasa di aplikasi TAPATUPA.

### 1. 🔐 Halaman Autentikasi (Login & Registrasi)

**Lokasi di App:** Paling awal saat membuka aplikasi

**Apa yang User Bisa Lakukan:**

#### A. Login
- **Aksi 1: Masuk Username/Email + Password**
  - User bisa masukkan username atau email
  - User masukkan password yang sudah terdaftar
  - Sistem validate kredensial
  - Jika benar → simpan token, masuk ke dashboard
  - Jika salah → tampilkan error message

- **Aksi 2: Lupa Password**
  - User bisa klik "Lupa Password"
  - Input email terdaftar
  - Sistem kirim link reset ke email
  - User klik link, buat password baru
  - Password di-update di database

- **Aksi 3: Tetap Login (Remember Me)**
  - User bisa centang "Remember Me"
  - Token disimpan di local storage
  - Kali berikutnya, bypass ke dashboard langsung
  - User bisa logout untuk clear token

#### B. Registrasi
- **Aksi 1: Buat Akun Baru**
  - User klik tombol "Daftar"
  - Isi form: Nama Lengkap, Email, No Telp, Username, Password
  - Sistem validate format email, kekuatan password
  - Sistem cek email/username sudah ada atau tidak
  - Jika valid → user dibuat di database, status "ACTIVE"
  - Notifikasi konfirmasi dikirim ke email user

- **Aksi 2: Verifikasi Email**
  - Email konfirmasi dikirim user saat registrasi
  - User klik link verifikasi
  - Email di-mark sebagai "VERIFIED"
  - User bisa login dan jalan semua fitur

- **Aksi 3: Upload Dokumen Identitas** (Opsional saat registrasi)
  - User bisa upload KTP
  - User bisa upload Surat Izin Tempat Tinggal
  - Dokumen disimpan di server untuk verifikasi admin

**Data yang Disimpan:**
- User ID
- Nama Lengkap
- Email
- Nomor Telepon
- Username
- Password (encrypted)
- Foto Profil (opsional)
- Status Verifikasi Email
- Tanggal Registrasi

---

### 2. 🏠 Halaman Dashboard Home

**Lokasi di App:** Halaman utama setelah login

**UI Layout:**
```
┌─────────────────────────────────┐
│  USER PROFILE SECTION           │
│  [Foto] Nama User               │
│  Edit Profile | Logout          │
├─────────────────────────────────┤
│  QUICK STATS / SUMMARY          │
│  ✓ Permohonan Pending: 2        │
│  ✓ Tagihan Belum Bayar: Rp 5M   │
│  ✓ Perjanjian Aktif: 1          │
├─────────────────────────────────┤
│  MENU NAVIGASI                  │
│  [Aset] [Tarif] [Permohonan]    │
│  [Perjanjian] [Pembayaran]      │
│  [Riwayat] [Profile]            │
└─────────────────────────────────┘
```

**Apa yang User Bisa Lakukan:**

- **Aksi 1: Lihat Ringkasan Data Pribadi**
  - Tampilkan nama, email, nomor telp
  - Tampilkan status verifikasi
  - Tampilkan foto profile (jika ada)

- **Aksi 2: Lihat Quick Stats / Summary**
  - Jumlah permohonan sedang pending
  - Total tagihan belum dibayar
  - Perjanjian aktif berapa banyak
  - Pembayaran terbaru kapan

- **Aksi 3: Akses Menu Utama**
  - Klik untuk navigasi ke setiap fitur
  - Menu tersedia:
    - 🏢 Aset Retribusi
    - 💰 Tarif Sewa
    - 📋 Permohonan Sewa
    - 📜 Perjanjian & Tagihan
    - 💳 Pembayaran
    - 🧾 Riwayat
    - 👤 Profile

- **Aksi 4: Edit Profil**
  - User klik "Edit Profile" di card profile
  - Bisa update: Nama, Email, Nomor Telp, Foto
  - Simpan perubahan
  - Sistem update ke database

- **Aksi 5: Logout**
  - User klik "Logout"
  - Token dihapus dari local storage
  - Session di-terminate
  - Redirect ke halaman login

- **Aksi 6: Refresh Data**
  - Pull-to-refresh untuk muat ulang
  - Atau user klik tombol refresh
  - Sistem re-fetch data dari server

**Data yang Ditampilkan:**
- Nama user, email, telepon
- Status verifikasi
- Ringkasan permohonan (BARU, PROSES, DISETUJUI, DITOLAK)
- Total tagihan pending
- Perjanjian aktif

---

### 3. 🏢 Halaman Aset Retribusi

**Lokasi di App:** Menu → Aset Retribusi

**UI Layout:**
```
┌──────────────────────────────┐
│  DAFTAR ASET RETRIBUSI       │
│  [Search] [Filter by Status] │
├──────────────────────────────┤
│  ┌────────────────────────┐  │
│  │ [Foto]                 │  │
│  │ Ruang Kantor Lantai 1  │  │
│  │ Lokasi: Jl. Merdeka    │  │
│  │ Status: AVAILABLE      │  │
│  │ [Lihat Detail]         │  │
│  └────────────────────────┘  │
│  ┌────────────────────────┐  │
│  │ [Foto]                 │  │
│  │ Ruang Meeting          │  │
│  │ Lokasi: Jl. Gatot      │  │
│  │ Status: AVAILABLE      │  │
│  │ [Lihat Detail]         │  │
│  └────────────────────────┘  │
│  ... (pagination)            │
└──────────────────────────────┘
```

**Apa yang User Bisa Lakukan:**

- **Aksi 1: Lihat Daftar Aset**
  - Sistem load dari API semua aset
  - Tampilkan dalam list/grid dengan pagination
  - Masing-masing aset tampilkan:
    - Foto/gambar aset
    - Nama aset
    - Lokasi/alamat aset
    - Status (AVAILABLE/UNAVAILABLE/MAINTENANCE)
    - Rating/review (jika ada)

- **Aksi 2: Search Aset**
  - User ketik nama aset di search box
  - Sistem filter real-time berdasarkan nama
  - Filter hasil berdasarkan keyword

- **Aksi 3: Filter by Status**
  - User klik filter status
  - Pilih: AVAILABLE, UNAVAILABLE, MAINTENANCE
  - Tampilkan hanya aset dengan status terpilih

- **Aksi 4: Filter by Lokasi**
  - User pilih lokasi dari dropdown
  - Sistem filter hasil aset by lokasi
  - Bisa multi-select lokasi

- **Aksi 5: Lihat Detail Aset**
  - User klik "Lihat Detail" pada aset
  - Halaman detail tampilkan:
    - Foto/galeri lengkap aset
    - Nama dan deskripsi
    - Lokasi dan alamat lengkap
    - Fasilitas yang tersedia (AC, WiFi, Parkir, dll)
    - Ukuran ruangan
    - Kapasitas
    - Status ketersediaan
    - Rating dari pengguna lain
    - Review/komentar pengguna
    - Harga dasar
    - Tombol "Lihat Tarif" → navigasi ke tarif
    - Tombol "Buat Permohonan" → navigasi ke form permohonan dengan aset ini terpilih

- **Aksi 6: Lihat Rating & Review**
  - User lihat rating bintang dari pengguna lain
  - Lihat review/komentar pengguna yang sudah nyewa
  - User bisa scroll melalui semua review

- **Aksi 7: Share Aset**
  - User bisa share aset ke social media
  - Copy link aset untuk dikirim ke teman

**Data yang Ditampilkan:**
- Asset ID, Name, Description
- Photos/Gallery URL
- Location & Address
- Facilities
- Size, Capacity
- Status (AVAILABLE/UNAVAILABLE)
- Price (base)
- Rating, Reviews
- Updated At timestamp

---

### 4. 💰 Halaman Tarif Sewa

**Lokasi di App:** Menu → Tarif Sewa

**UI Layout:**
```
┌──────────────────────────────┐
│  DAFTAR TARIF SEWA           │
│  [Filter by Asset] [Sort]    │
├──────────────────────────────┤
│  Tarif Per Hari              │
│  ┌────────────────────────┐  │
│  │ Rp 500.000 / hari      │  │
│  │ Min. 1 hari            │  │
│  │ DP: 30%                │  │
│  │ [Lihat Detail]         │  │
│  └────────────────────────┘  │
│  Tarif Per Bulan             │
│  ┌────────────────────────┐  │
│  │ Rp 10.000.000 / bulan  │  │
│  │ Min. 1 bulan           │  │
│  │ DP: 25%                │  │
│  │ [Lihat Detail]         │  │
│  └────────────────────────┘  │
└──────────────────────────────┘
```

**Apa yang User Bisa Lakukan:**

- **Aksi 1: Lihat Daftar Tarif**
  - Sistem load tarif dari API
  - Tampilkan tarif dalam list/group by durasi
  - Masing-masing tarif tampilkan:
    - Nama tarif (Per Hari/Minggu/Bulan)
    - Harga
    - Minimum durasi sewa
    - DP (down payment) persentase
    - Tombol detail

- **Aksi 2: Filter by Aset**
  - User pilih aset dari dropdown
  - Sistem tampilkan hanya tarif untuk aset tersebut
  - Bisa lihat variasi harga per aset

- **Aksi 3: Sort Tarif**
  - User bisa sort by:
    - Harga (Terendah/Tertinggi)
    - Durasi (Singkat ke Panjang)
    - Terbaru Diupdate

- **Aksi 4: Lihat Detail Tarif**
  - User klik "Lihat Detail"
  - Halaman detail tampilkan:
    - Nama tarif lengkap
    - Harga detail
    - Duration (jumlah hari/minggu/bulan)
    - Minimum durasi sewa
    - DP (Down Payment) persentase dan nominal
    - Syarat & ketentuan sewa
    - Promo (jika ada)
    - Dokumen persyaratan (file PDF)
    - Tombol "Download Dokumen"
    - Tombol "Buat Permohonan" with tarif ini

- **Aksi 5: Download Dokumen Persyaratan**
  - User klik "Download"
  - Sistem provide file untuk didownload
  - File bisa PDF, Word, atau gambar

- **Aksi 6: Lihat Promo**
  - Jika ada promo untuk tarif tertentu
  - Tampilkan: Jenis promo, Diskon%, Periode berlaku
  - User bisa lihat berapa harga final setelah promo

**Data yang Ditampilkan:**
- Tariff ID, Name, Description
- Asset ID (linked to aset)
- Duration (value), Duration Unit (day/week/month)
- Price, Discount, Final Price
- Min Duration
- DP Percentage
- Terms & Conditions
- Document URL
- Promo (if available)

---

### 5. 📋 Halaman Buat Permohonan Sewa

**Lokasi di App:** Menu → Permohonan → Tombol "Buat Baru"

**UI Layout:**
```
┌──────────────────────────────┐
│  FORM PERMOHONAN SEWA        │
├──────────────────────────────┤
│  Pilih Aset *                │
│  [Dropdown: Ruang Kantor]    │
├──────────────────────────────┤
│  Tanggal Mulai *             │
│  [DatePicker: 2026-04-15]    │
├──────────────────────────────┤
│  Tanggal Selesai *           │
│  [DatePicker: 2026-04-30]    │
├──────────────────────────────┤
│  Keperluan *                 │
│  [Text: Kantor Cabang]       │
├──────────────────────────────┤
│  Upload Dokumen              │
│  ☑ KTP       [Upload +]      │
│  ☑ Domisili  [Upload +]      │
│  ☑ Surat     [Upload +]      │
├──────────────────────────────┤
│  Catatan Tambahan (opsional) │
│  [Text Area: ...]            │
├──────────────────────────────┤
│  [BATAL]  [KIRIM PERMOHONAN] │
└──────────────────────────────┘
```

**Apa yang User Bisa Lakukan:**

- **Aksi 1: Pilih Aset**
  - User buka dropdown "Pilih Aset"
  - Tampilkan list aset yang AVAILABLE
  - User pilih satu aset
  - Tampilkan foto aset yang dipilih

- **Aksi 2: Tentukan Durasi Sewa**
  - User klik "Tanggal Mulai"
  - Calendar picker terbuka
  - User pilih tanggal mulai
  - Input minimum adalah hari ini/besok
  - User klik "Tanggal Selesai"
  - Calendar picker terbuka
  - User pilih tanggal selesai
  - Sistem otomatis hitung jumlah hari/minggu/bulan
  - Tampilkan harga di bawah

- **Aksi 3: Lihat Harga Estimasi**
  - Sistem hitung otomatis:
    - Durasi sewa (berapa hari/minggu/bulan)
    - Tarif per durasi
    - Harga normal = durasi × tarif
    - Harga DP = harga × DP persentase
    - Harga sisa = harga normal - DP
  - Tampilkan breakdown harga:
    - Subtotal: Rp X.XXX.XXX
    - DP (30%): Rp X.XXX.XXX
    - Sisa Pembayaran: Rp X.XXX.XXX

- **Aksi 4: Isi Keperluan Sewa**
  - User ketik di field "Keperluan"
  - Contoh: "Kantor Cabang", "Meeting Klien", "Workshop"
  - Ini catatan untuk admin apa keperluannya

- **Aksi 5: Upload Dokumen Pendukung**
  - User lihat checklist dokumen yang dibutuhkan:
    - ☑ KTP (wajib)
    - ☑ Surat Domisili (wajib)
    - ☑ Surat Izin Usaha (opsional)
  - User klik "Upload" pada masing-masing dokumen
  - System buka file picker (gallery/camera)
  - User pilih file dari device
  - Tampilkan thumbnail file yang diupload
  - User bisa re-upload jika ingin ganti file
  - Sistem validasi:
    - File harus PDF atau image (JPG, PNG)
    - File size max 5MB
    - Jika tidak valid, tampilkan error message

- **Aksi 6: Tambah Catatan (Opsional)**
  - User bisa tambah catatan khusus di field "Catatan Tambahan"
  - Contoh: "Butuh fasilitas khusus AC dijaga pada suhu 18°C"
  - Tidak wajib diisi

- **Aksi 7: Review Permohonan Sebelum Submit**
  - User lihat ringkasan:
    - Aset yang dipilih
    - Tanggal mulai - selesai
    - Durasi sewa
    - Harga total
    - Dokumen yang diupload
  - User bisa klik "Edit" untuk mengubah
  - Atau klik "Batal" untuk cancel

- **Aksi 8: Submit Permohonan**
  - User klik "KIRIM PERMOHONAN"
  - Sistem validasi:
    - Aset wajib dipilih
    - Tanggal wajib valid
    - Dokumen minimal KTP + Domisili
  - Jika valid, sistem simpan permohonan:
    - Status = "BARU"
    - Submitted At = timestamp sekarang
    - Assigned to user = current user
  - Generate nomor permohonan: REQ-YYYY-XXXXX
  - Tampilkan confirmation dialog dengan nomor permohonan
  - Kirim email notifikasi ke user
  - Redirect ke halaman detail permohonan

**Data yang Disimpan:**
- Request ID, Request Number
- User ID (pemohon)
- Asset ID (aset yang diminta)
- Start Date, End Date, Duration
- Purpose (keperluan)
- Documents (file URLs)
- Notes
- Status (default: BARU)
- Total Price, DP Amount
- Created At, Updated At

---

### 6. 📌 Halaman Lihat Daftar Permohonan

**Lokasi di App:** Menu → Permohonan

**UI Layout:**
```
┌──────────────────────────────┐
│  DAFTAR PERMOHONAN SAYA      │
│  [Filter: All/BARU/PROSES]   │
│  [Sort: Terbaru/Tertua]      │
├──────────────────────────────┤
│  ┌────────────────────────┐  │
│  │ REQ-2026-0001          │  │ ◀ Status badge warna
│  │ Ruang Kantor Lantai 1  │  │
│  │ 15 Apr - 30 Apr 2026   │  │
│  │ Status: DISETUJUI ✓    │  │
│  │ [Lihat Detail]         │  │
│  └────────────────────────┘  │
│  ┌────────────────────────┐  │
│  │ REQ-2026-0002          │  │ ◀ Status badge
│  │ Ruang Meeting          │  │
│  │ 1 May - 7 May 2026     │  │
│  │ Status: PROSES ⏳      │  │
│  │ [Lihat Detail]         │  │
│  └────────────────────────┘  │
│  ┌────────────────────────┐  │
│  │ REQ-2026-0003          │  │ ◀ Status badge
│  │ Ruang Workshop         │  │
│  │ 10 May - 15 May 2026   │  │
│  │ Status: DITOLAK ✗      │  │
│  │ [Lihat Detail]         │  │
│  └────────────────────────┘  │
│  ... (pagination)            │
└──────────────────────────────┘
```

**Apa yang User Bisa Lakukan:**

- **Aksi 1: Lihat Daftar Permohonan User**
  - Sistem load semua permohonan milik user
  - Tampilkan dalam list dengan pagination
  - Sorting default: Terbaru dulu
  - Masing-masing permohonan tampilkan:
    - Nomor permohonan (REQ-YYYY-XXXXX)
    - Nama aset yang diminta
    - Tanggal mulai - selesai
    - Status (dengan color badge):
      - 🔵 BARU = Blue
      - 🟡 PROSES = Yellow
      - 🟢 DISETUJUI = Green
      - 🔴 DITOLAK = Red

- **Aksi 2: Filter by Status**
  - User klik dropdown "Filter"
  - Pilihan:
    - All (semua status)
    - BARU (baru diajukan)
    - PROSES (sedang diverifikasi admin)
    - DISETUJUI (sudah disetujui)
    - DITOLAK (ditolak oleh admin)
  - Tampilkan hanya permohonan dengan status terpilih

- **Aksi 3: Sort Permohonan**
  - User klik dropdown "Sort"
  - Pilihan:
    - Terbaru Dulu (default)
    - Tertua Dulu
    - Aset (A-Z)
  - Sistem sort dan reload list

- **Aksi 4: Search Permohonan**
  - User bisa search berdasarkan:
    - Nomor permohonan (REQ-2026-0001)
    - Nama aset (Ruang Kantor)
  - Real-time search filter

- **Aksi 5: Lihat Detail Permohonan**
  - User klik "Lihat Detail" pada permohonan
  - Halaman detail tampilkan:
    - Nomor permohonan
    - Aset yang diminta (nama, foto, lokasi)
    - Tanggal mulai - selesai
    - Keperluan sewa
    - Dokumen-dokumen yang diupload (dengan preview)
    - Status terkini dengan penjelasan
    - Keterangan dari admin (jika ada)
    - Timeline status (BARU → PROSES → DISETUJUI)
    - Harga yang disepakati

- **Aksi 6: Lihat Status & Keterangan**
  - Jika status BARU:
    - "Permohonan Anda sedang menunggu verifikasi admin"
  - Jika status PROSES:
    - "Permohonan Anda sedang dalam proses verifikasi dokumen"
  - Jika status DISETUJUI:
    - "Permohonan Anda telah disetujui! Lihat perjanjian di menu Perjanjian & Tagihan"
    - Tampilkan tombol "Lihat Perjanjian"
  - Jika status DITOLAK:
    - "Permohonan Anda ditolak. Alasan: [alasan dari admin]"
    - Tampilkan tombol "Buat Permohonan Baru"

- **Aksi 7: Download Dokumen Permohonan**
  - Jika user ingin backup dokumen yang sudah diupload
  - User bisa klik dokumen
  - Sistem download file ke device

- **Aksi 8: Edit Permohonan** (Jika masih status BARU)
  - Jika permohonan masih BARU dan belum diproses admin
  - User bisa klik "Edit"
  - Kembali ke form permohonan untuk edit
  - Bisa ubah: Aset, tanggal, keperluan, dokumen
  - Submit ulang dengan status BARU lagi

- **Aksi 9: Hapus Permohonan** (Jika masih BARU)
  - Jika permohonan masih BARU
  - User bisa klik "Hapus"
  - Confirmation dialog: "Yakin ingin hapus?"
  - Jika hapus → permohonan dihapus dari database

**Data yang Ditampilkan:**
- Request ID, Request Number, Status
- Asset Name, Asset Photo
- Start Date, End Date
- Purpose
- Documents (file names & URLs)
- Admin Notes (if any)
- Total Price
- Created At, Updated At

---

### 7. 📜 Halaman Lihat Perjanjian & Tagihan

**Lokasi di App:** Menu → Perjanjian & Tagihan

**UI Layout:**
```
┌──────────────────────────────┐
│  PERJANJIAN & TAGIHAN        │
│  [Tab: Perjanjian|Tagihan]   │
├──────────────────────────────┤
│  PERJANJIAN AKTIF (Tab)      │
│  ┌────────────────────────┐  │
│  │ No. Perjanjian: AGR-001│  │
│  │ Ruang Kantor Lantai 1  │  │
│  │ 15 Apr - 30 Apr 2026   │  │
│  │ Status: AKTIF ✓        │  │
│  │ [Lihat Detail]         │  │
│  └────────────────────────┘  │
│                              │
│  TAGIHAN (Tab)               │
│  ┌────────────────────────┐  │
│  │ Tagihan - AGR-001      │  │
│  │ Rp 5.000.000           │  │
│  │ Jatuh Tempo: 25 Apr    │  │
│  │ Status: BELUM BAYAR 🔴 │  │
│  │ [Bayar] [Detail]       │  │
│  └────────────────────────┘  │
│  ┌────────────────────────┐  │
│  │ Tagihan - AGR-002      │  │
│  │ Rp 2.000.000           │  │
│  │ Jatuh Tempo: 5 May     │  │
│  │ Status: LUNAS ✓        │  │
│  │ [Detail]               │  │
│  └────────────────────────┘  │
└──────────────────────────────┘
```

**Apa yang User Bisa Lakukan:**

- **Aksi 1: Lihat Daftar Perjanjian Aktif**
  - Sistem load semua perjanjian user
  - Filter hanya yang status AKTIF
  - Tampilkan:
    - Nomor perjanjian
    - Aset yang disewa
    - Tanggal mulai - selesai
    - Status (AKTIF = Green)
    - Tombol "Lihat Detail"

- **Aksi 2: Lihat Detail Perjanjian**
  - User klik "Lihat Detail"
  - Tampilkan:
    - Nomor perjanjian lengkap
    - Aset (nama, foto, lokasi, fasilitas)
    - Penyewa (nama, alamat, nomor identitas)
    - Tanggal perjanjian dibuat
    - Tanggal berlaku mulai - selesai
    - Durasi sewa
    - Harga yang disepakati:
      - Subtotal
      - DP yang sudah dibayar
      - Sisa pembayaran
    - Syarat & ketentuan perjanjian (file PDF)
    - Status perjanjian
    - Tombol "Download Perjanjian"
    - Tombol "Lihat Tagihan Terkait"

- **Aksi 3: Lihat Daftar Tagihan**
  - User klik tab "Tagihan"
  - Sistem load semua tagihan milik user
  - Tampilkan:
    - Nomor tagihan
    - Perjanjian terkait
    - Nominal tagihan
    - Tanggal jatuh tempo
    - Status (BELUM BAYAR = Red, LUNAS = Green)
    - Tombol "Bayar" (hanya jika BELUM BAYAR)
    - Tombol "Detail"

- **Aksi 4: Filter Tagihan by Status**
  - Filter: Semua, Belum Bayar, Lunas
  - Tampilkan hanya tagihan dengan status terpilih

- **Aksi 5: Lihat Detail Tagihan**
  - User klik "Detail" pada tagihan
  - Tampilkan:
    - Nomor tagihan lengkap
    - Perjanjian terkait
    - Aset yang disewa
    - Tanggal tagihan dibuat
    - Tanggal jatuh tempo
    - Nominal tagihan detail (breakdown)
    - Status pembayaran
    - Jika sudah bayar: tanggal pembayaran, nomor VA, bukti pembayaran
    - Tombol "Download Tagihan" (PDF)

- **Aksi 6: Download Dokumen**
  - User bisa download perjanjian dalam PDF
  - User bisa download tagihan dalam PDF
  - File tersimpan di device

---

### 8. 💳 Halaman Pembayaran Tagihan

**Lokasi di App:** Menu → Tagihan → Klik Tombol "Bayar"

**UI Layout:**
```
┌──────────────────────────────┐
│  METODE PEMBAYARAN           │
|  [← Kembali]                 │
├──────────────────────────────┤
│  Tagihan: INV-2026-0001      │
│  Nominal: Rp 5.000.000       │
│  Jatuh Tempo: 25 April 2026  │
├──────────────────────────────┤
│  Pilih Metode Pembayaran:    │
│  ☐ Transfer Bank Manual      │
│  ☑ Virtual Account (Va)      │ ◀ Default
│  ☐ E-Wallet                  │
│  ☐ Debit Card                │
├──────────────────────────────┤
│  NOMOR VIRTUAL ACCOUNT:      │
│  [Copy Icon]                 │
│  12345 6789012 3456 7        │
│  (23 digit)                  │
│≈≈ INSTRUKSI PEMBAYARAN ≈≈   │
│  1. Buka aplikasi bank       │
│  2. Pilih Transfer/Bayar     │
│  3. Input nomor VA di atas   │
│  4. Masukkan nominal Rp 5M   │
│  5. Klik Bayar               │
│  6. Tunggu 1-5 menit         │
│                              │
│  Status Pembayaran:          │
│  ⏳ Menunggu konfirmasi...   │
│  (Auto-refresh setiap 5 det) │
│                              │
│  [BATAL] [LIHAT BUKTI]       │
└──────────────────────────────┘
```

**Apa yang User Bisa Lakukan:**

- **Aksi 1: Pilih Tagihan untuk Bayar**
  - User dari halaman Tagihan klik "Bayar"
  - Sistem persiapan halaman pembayaran
  - Tampilkan detail tagihan:
    - Nomor tagihan
    - Nominal
    - Tanggal jatuh tempo
    - Aset terkait

- **Aksi 2: Pilih Metode Pembayaran**
  - User melihat pilihan metode:
    1. Transfer Bank Manual (user transfer sendiri)
    2. **Virtual Account (VA)** ← Default, recommended
    3. E-Wallet (GoPay, OVO, DANA)
    4. Debit Card
  - User pilih salah satu (default: VA)

- **Aksi 3: Generate Virtual Account**
  - User klik "Lanjutkan Pembayaran"
  - Sistem connect ke payment gateway (Midtrans)
  - Midtrans generate nomor VA unik untuk transaksi ini
  - Sistem tampilkan nomor VA:
    - **Nomor VA: 12345 6789012 3456 7** (23 digit)
    - Format: [Bank Code] [Merchant Code] [Invoice ID] [Checksum]

- **Aksi 4: Copy Nomor VA**
  - User bisa klik tombol "Copy" di samping nomor
  - Nomor tersalin ke clipboard
  - Notifikasi "Nomor VA berhasil disalin"

- **Aksi 5: Preview Instruksi Pembayaran**
  - Sistem tampilkan step-by-step cara bayar:
    1. Buka aplikasi bank (BCA, Mandiri, BRI, dll)
    2. Pilih menu Transfer atau Bayar Tagihan
    3. Input nomor VA di field penerima
    4. Input nominal (Rp 5.000.000)
    5. Klik Bayar
    6. Tunggu 1-5 menit untuk konfirmasi

- **Aksi 6: Monitoring Status Pembayaran**
  - Setelah user masukkan nomor VA, tampilkan:
    - "⏳ Menunggu konfirmasi pembayaran..."
  - Sistem auto-poll/refresh setiap 5 detik mengecek status ke payment gateway
  - Jika pembayaran sudah masuk:
    - Status berubah jadi "✓ Pembayaran Berhasil!"
    - Tampilkan detail:
      - Waktu pembayaran terkonfirmasi
      - Nomor referensi dari bank
      - Nominal yang diterima
  - Jika VA expired (tidak ada pembayaran dalam 24 jam):
    - Tampilkan "❌ VA Expired"
    - User bisa buat VA baru

- **Aksi 7: Lihat Bukti Pembayaran**
  - Setelah pembayaran sukses
  - User bisa klik "Lihat Bukti"
  - Tampilkan receipt/bukti:
    - Nomor tagihan
    - Nomor VA
    - Nominal
    - Waktu pembayaran
    - Referensi transaksi dari bank
    - QR Code receipt

- **Aksi 8: Download Bukti Pembayaran**
  - User bisa download bukti pembayaran dalam PDF
  - File tersimpan di device

- **Aksi 9: Share Bukti Pembayaran**
  - User bisa share bukti via WhatsApp, Email
  - Untuk keperluan administratif

- **Aksi 10: Batal Pembayaran**
  - Jika user klik "BATAL"
  - VA di-cancel
  - Redirect kembali ke halaman tagihan
  - VA tetap bisa digunakan sampai 24 jam

**Data yang Disimpan:**
- Payment ID, Invoice ID, VA Number
- Transaction Amount, Payment Method
- Payment Status (PENDING/SUCCESS/FAILED/EXPIRED)
- Payment Time
- Bank Reference Number
- Receipt URL

---

### 9. 🧾 Halaman Riwayat Pembayaran

**Lokasi di App:** Menu → Riwayat Pembayaran

**UI Layout:**
```
┌──────────────────────────────┐
│  RIWAYAT PEMBAYARAN          │
│  [Filter: All/Bulan/Tahun]   │
│  [Sort: Terbaru/Terbesar]    │
├──────────────────────────────┤
│  APRIL 2026                  │
│  ┌────────────────────────┐  │
│  │ 20 April 2026          │  │
│  │ Tagihan INV-2026-0001  │  │
│  │ Rp 5.000.000      ✓    │  │
│  │ Via: Virtual Account   │  │
│  │ Ref: 123456789         │  │
│  │ [Lihat Detail]         │  │
│  └────────────────────────┘  │
│  ┌────────────────────────┐  │
│  │ 10 April 2026          │  │
│  │ Tagihan INV-2026-0002  │  │
│  │ Rp 2.500.000      ✓    │  │
│  │ Via: Virtual Account   │  │
│  │ Ref: 987654321         │  │
│  │ [Lihat Detail]         │  │
│  └────────────────────────┘  │
│  MARCH 2026                  │
│  ┌────────────────────────┐  │
│  │ 25 March 2026          │  │
│  │ Tagihan INV-2026-0003  │  │
│  │ Rp 1.500.000      ✓    │  │
│  │ Via: E-Wallet          │  │
│  │ Ref: 456789123         │  │
│  │ [Lihat Detail]         │  │
│  └────────────────────────┘  │
└──────────────────────────────┘
```

**Apa yang User Bisa Lakukan:**

- **Aksi 1: Lihat Daftar Pembayaran Berhasil**
  - Sistem load semua pembayaran yang status LUNAS
  - Tampilkan dalam list grouped by bulan
  - Masing-masing pembayaran tampilkan:
    - Tanggal pembayaran
    - Nomor tagihan
    - Nominal
    - Metode pembayaran (VA, E-Wallet, dll)
    - Referensi transaksi (Ref No)
    - Status (✓ Berhasil)

- **Aksi 2: Filter by Periode**
  - User bisa filter:
    - Semua (all time)
    - Sebulan terakhir
    - 3 bulan terakhir
    - 1 tahun terakhir
    - Range tanggal custom
  - Sistem reload list sesuai filter

- **Aksi 3: Sort Pembayaran**
  - User bisa sort by:
    - Terbaru Dulu (default)
    - Tertua Dulu
    - Nominal Terbesar
    - Nominal Terkecil

- **Aksi 4: Search Pembayaran**
  - User bisa search berdasarkan:
    - Nomor tagihan
    - Referensi transaksi
    - Nominal

- **Aksi 5: Lihat Detail Pembayaran**
  - User klik "Lihat Detail"
  - Tampilkan halaman detail:
    - Nomor transaksi pembayaran
    - Tanggal & waktu pembayaran
    - Nomor tagihan (linked)
    - Nomor VA yang digunakan
    - Aset yang disewa
    - Nominal pembayaran
    - Metode pembayaran
    - Referensi transaks dari bank
    - Status: LUNAS
    - Waktu konfirmasi
    - Tombol "Download Bukti"
    - Tombol "Download Kwitansi" (jika disediakan)

- **Aksi 6: Download Bukti Pembayaran**
  - User bisa download bukti pembayaran (PDF)
  - Detail:
    - Invoice number
    - Payment amount
    - Payment date
    - Payment method
    - Bank reference

- **Aksi 7: Download Kwitansi**
  - Sistem provide kwitansi pembayaran (jika ada)
  - Bisa PDF atau print-ready format

- **Aksi 8: Export Laporan**
  - User bisa export seluruh riwayat pembayaran
  - Format: PDF atau Excel
  - Laporan periode yang dipilih

**Data yang Ditampilkan:**
- Payment ID, Payment Date & Time
- Invoice ID, VA Number
- Amount, Payment Method
- Bank Reference Number
- Status
- Receipt URL, Kwitansi URL

---

### 10. 👤 Halaman Profile & Logout

**Lokasi di App:** Menu → Profile / Bottom Navigation

**UI Layout:**
```
┌──────────────────────────────┐
│  PROFILE PENGGUNA            │
├──────────────────────────────┤
│          [Foto Besar]        │
│        Nama Lengkap          │
│    nama@email.com            │
│   +62-812-3456-7890          │
├──────────────────────────────┤
│  INFORMASI PRIBADI           │
│  Nama          : John Doe    │
│  Email         : j@email.com │
│  No. Telepon   : +62...      │
│  Alamat        : Jl. Gatot   │
│  Kota/Provinsi : Jakarta     │
│  Kode Pos      : 12345       │
│  Nomor Identitas: 3171...    │
├──────────────────────────────┤
│  [EDIT PROFILE]              │
├──────────────────────────────┤
│  KEAMANAN                    │
│  [Ubah Password]             │
│  [2-Factor Authentication]   │
├──────────────────────────────┤
│  PREFERENSI                  │
│  Notifikasi Push : ON ◉      │
│  Email Notif    : ON ◉       │
│  Tema           : Light      │
│  Bahasa         : Bahasa     │
├──────────────────────────────┤
│  [LOGOUT]                    │
│  [Hapus Akun]                │
└──────────────────────────────┘
```

**Apa yang User Bisa Lakukan:**

- **Aksi 1: Lihat Profil Lengkap**
  - Sistem tampilkan data lengkap user:
    - Foto profil (jika ada)
    - Nama lengkap
    - Email
    - Nomor telepon
    - Alamat lengkap
    - Kota/Provinsi
    - Kode Pos
    - Nomor Identitas (KTP/SIM)
    - Status verifikasi email
    - Tanggal bergabung
    - Terakhir login

- **Aksi 2: Edit Profil**
  - User klik "EDIT PROFILE"
  - Halaman edit form terbuka:
    - Foto (bisa upload/ubah)
    - Nama lengkap (bisa edit)
    - Email (bisa edit, tapi harus verifikasi ulang)
    - Nomor telepon (bisa edit)
    - Alamat, Kota, Kode Pos (bisa edit)
  - User klik "SIMPAN"
  - Sistem update data ke database
  - Notifikasi "Profil berhasil diupdate"

- **Aksi 3: Upload Foto Profil**
  - User klik foto di halaman profile
  - Bisa pilih:
    - Upload dari gallery
    - Ambil foto dari camera
  - Crop & resize foto
  - Save, sistem upload ke server
  - Foto updated di profil

- **Aksi 4: Ubah Password**
  - User klik "Ubah Password"
  - Form muncul:
    - Password Lama (wajib)
    - Password Baru (wajib, minimal 8 karakter)
    - Konfirmasi Password Baru (wajib)
  - Sistem validate:
    - Password lama harus benar
    - Password baru minimal 8 karakter
    - Password baru & konfirmasi harus sama
  - Jika valid → password di-encrypt dan disimpan
  - User logout otomatis untuk login ulang
  - Notifikasi "Password berhasil diubah"

- **Aksi 5: 2-Factor Authentication (2FA)**
  - User bisa enable/disable 2FA untuk keamanan extra
  - Jika enable:
    - Pilih metode: SMS atau Authenticator App
    - Setelah login username+password, akan minta kode 6-digit
    - Kode dikirim via SMS atau generated by app
    - User input kode untuk complete login

- **Aksi 6: Preferensi Notifikasi**
  - User bisa toggle:
    - Push Notification (ON/OFF)
    - Email Notification (ON/OFF)
  - Jika ON → user terima notifikasi real-time
  - Jika OFF → user tidak terima notifikasi

- **Aksi 7: Ubah Tema & Bahasa**
  - User pilih tema: Light / Dark
  - User pilih bahasa: Bahasa Indonesia / English
  - Sistem reload app dengan setting baru

- **Aksi 8: Lihat Sesi Aktif**
  - User bisa lihat device apa saja yang login akun ini
  - Device Name, OS, IP, Last Online
  - User bisa "Logout Remote" jika ada device yang tidak dikenali

- **Aksi 9: Logout**
  - User klik "LOGOUT"
  - Konfirmasi: "Anda akan logout dari aplikasi. Yakin?"
  - Jika ya:
    - Token dihapus dari local storage
    - Session di-terminate
    - Redirect ke halaman login

- **Aksi 10: Hapus Akun** (optional)
  - User klik "Hapus Akun"
  - Confirmation: "Hapus akun permanen? Data tidak bisa dipulihkan!"
  - User harus input password untuk confirm
  - Jika confirm:
    - Akun di-mark sebagai deleted
    - Semua data pribadi dihapus
    - User tidak bisa login lagi

**Data yang Ditampilkan:**
- User ID, Name, Email, Phone
- Address, City, Postal Code
- ID Number, ID Type
- Profile Photo URL
- Email Verified Status
- 2FA Enabled/Disabled
- Notification Preferences
- Theme, Language
- Last Login
- Created At

---

## 👮 FITUR ADMIN (PETUGAS LAPANGAN)

Admin/Petugas adalah role khusus untuk pengelolaan sistem. Di bagian ini akan dijelaskan semua fitur yang bisa dilakukan oleh admin.

### 1. 🔐 Halaman Login Admin

**Lokasi di App:** Halaman login awal, pilih mode "Admin"

**Apa yang Admin Bisa Lakukan:**

- **Aksi 1: Masuk Mode Admin**
  - Saat login, tampilkan 2 pilihan:
    - ☑ Login sebagai User Biasa (default)
    - ☐ Login sebagai Admin/Petugas
  - Admin centang "Login sebagai Admin"
  - Form login berubah untuk admin credentials

- **Aksi 2: Input Kredensial Admin**
  - Username/Email + Password khusus admin
  - Kredensial ini berbeda dari user biasa
  - Sistem validate ke database credentials table admin
  - Jika valid → generate token khusus admin (dengan role="ADMIN")
  - Simpan token di local storage
  - Redirect ke admin dashboard

- **Aksi 3: Validasi Role Admin**
  - Sistem check apakah user ini adalah admin
  - User harus punya role "ADMIN" atau "PETUGAS" di database
  - Jika bukan admin → error "Akses ditolak"

**Data yang Diperiksa:**
- Username / Email
- Password (encrypted)
- Role (ADMIN / USER)
- Admin Status (ACTIVE / INACTIVE)

---

### 2. 📊 Halaman Dashboard Admin

**Lokasi di App:** Page awal setelah admin login

**UI Layout:**
```
┌──────────────────────────────┐
│  DASHBOARD ADMIN TAPATUPA    │
│  [👮 Admin Name] [Logout]    │
├──────────────────────────────┤
│  STATISTIK REALTIME          │
│  ┌─────────┐ ┌─────────┐    │
│  │Permohonan│ │Tagihan  │    │
│  │  12 NEW  │ │Pending  │    │
│  │ 8 PROSES │ │Rp 50M   │    │
│  └─────────┘ └─────────┘    │
│  ┌─────────┐ ┌─────────┐    │
│  │Pembayaran│ │Revenue  │    │
│  │  5 Done  │ │Rp 100M  │    │
│  │ 2 Pending│ │This Mo  │    │
│  └─────────┘ └─────────┘    │
├──────────────────────────────┤
│  MENU ADMIN UTAMA            │
│  [Permohonan] [Perjanjian]   │
│  [Pembayaran] [Laporan]      │
│  [Aset] [Tarif]              │
│  [User] [Settings]           │
│                              │
│  ACTIVITY LOG (Recent)       │
│  • John submit permohonan    │
│  • Admin approve permohonan  │
│  • Payment received Rp 5M    │
│  ...                         │
└──────────────────────────────┘
```

**Apa yang Admin Bisa Lakukan:**

- **Aksi 1: Lihat Dashboard Summary**
  - Sistem load dan tampilkan statistik real-time:
    - **Permohonan:**
      - Total NEW (baru diajukan)
      - Total PROSES (sedang diverifikasi)
      - Total DISETUJUI
      - Total DITOLAK
    - **Perjanjian:**
      - Total AKTIF sekarang
      - Total sudah SELESAI
    - **Tagihan:**
      - Total BELUM BAYAR (outstanding)
      - Total LUNAS
      - Total nominal outstanding
    - **Pembayaran:**
      - Total transaksi hari ini
      - Total nominal pembayaran hari ini
      - Pembayaran pending (belum confirmed)
    - **Revenue:**
      - Total revenue bulan ini
      - Total revenue tahun ini
      - Revenue per aset (top 5)

- **Aksi 2: Lihat Chart/Graph**
  - Admin bisa lihat visualization:
    - Grafik permohonan status (pie/bar chart)
    - Grafik revenue trend (line chart)
    - Grafik aset utilization (block chart)

- **Aksi 3: Lihat Activity Log**
  - Tampilkan recent activities:
    - User X mengajukan permohonan
    - Admin Y approve permohonan
    - Pembayaran Rp X diterima
    - Perjanjian dibuat/diakhiri
    - Timestamps untuk setiap activity

- **Aksi 4: Akses Menu Utama Admin**
  - Tampilkan menu navigasi:
    - 📋 **Permohonan** - Manage all requests
    - 📜 **Perjanjian** - Manage agreements
    - 💳 **Pembayaran** - Monitor payments
    - 📊 **Laporan** - Generate reports
    - 🏢 **Aset** - Manage assets
    - 💰 **Tarif** - Manage pricing
    - 👥 **User** - Manage user accounts
    - ⚙️ **Settings** - System settings

- **Aksi 5: Filter Dashboard by Periode**
  - Admin bisa pilih periode untuk statistik:
    - Hari ini
    - 7 hari terakhir
    - Bulan ini
    - Tahun ini
    - Custom range
  - Statistik update sesuai periode

- **Aksi 6: Export Report**
  - Admin bisa export dashboard summary ke PDF/Excel

---

### 3. 📋 Halaman Monitoring Permohonan (Admin)

**Lokasi di App:** Menu → Permohonan

**UI Layout:**
```
┌──────────────────────────────┐
│  MONITORING PERMOHONAN       │
│  [Filter: All/BARU/PROSES]   │
│  [Search] [Sort]             │
├──────────────────────────────┤
│  BARU (2)                    │
│  ┌────────────────────────┐  │
│  │ REQ-2026-0010          │  │
│  │ John Doe               │  │
│  │ Ruang Kantor Lantai 1  │  │
│  │ 15 Apr - 30 Apr 2026   │  │
│  │ Submitted: 2 Apr 10:30 │  │
│  │ [Review] [Approve]     │  │
│  │ [Reject]               │  │
│  └────────────────────────┘  │
│  ┌────────────────────────┐  │
│  │ REQ-2026-0011          │  │
│  │ Jane Smith             │  │
│  │ Ruang Meeting          │  │
│  │ 1 May - 7 May 2026     │  │
│  │ Submitted: 1 Apr 14:15 │  │
│  │ [Review] [Approve]     │  │
│  │ [Reject]               │  │
│  └────────────────────────┘  │
│                              │
│  PROSES (1)                  │
│  ┌────────────────────────┐  │
│  │ REQ-2026-0009          │  │
│  │ Jake Wilson            │  │
│  │ Ruang Workshop         │  │
│  │ 10 May - 15 May 2026   │  │
│  │ Under Review: 1 Apr    │  │
│  │ [View Detail]          │  │
│  └────────────────────────┘  │
└──────────────────────────────┘
```

**Apa yang Admin Bisa Lakukan:**

- **Aksi 1: Lihat Semua Permohonan**
  - Sistem load permohonan dari semua user
  - Tampilkan dalam list grouped by status
  - Setiap permohonan tampilkan:
    - Nomor permohonan (REQ-YYYY-XXXXX)
    - Nama pemohon (user)
    - Aset yang diminta
    - Tanggal mulai - selesai
    - Status
    - Waktu submission
    - Tombol action (Review, Approve, Reject)

- **Aksi 2: Filter by Status**
  - Filter pilihan:
    - All (semua status)
    - BARU (baru diajukan, belum di-review)
    - PROSES (sedang di-review)
    - DISETUJUI (sudah di-approve)
    - DITOLAK (sudah di-reject)
  - Sistem filter dan reload list

- **Aksi 3: Search Permohonan**
  - Admin bisa search berdasarkan:
    - Nomor permohonan (REQ-2026-0001)
    - Nama user/pemohon
    - Nama aset
  - Real-time search filter

- **Aksi 4: Sort Permohonan**
  - Sort pilihan:
    - Terbaru Diajukan
    - Tertua Diajukan
    - Nama User (A-Z)
    - Status

- **Aksi 5: Review Detail Permohonan**
  - Admin klik "Review" atau "View Detail"
  - Halaman detail menampilkan:
    - **Informasi Pemohon:**
      - Nama, Email, No Telp
      - Alamat, Nomor Identitas
      - Status verifikasi user
    - **Informasi Permohonan:**
      - Nomor permohonan
      - Aset yang diminta
      - Tanggal mulai - selesai
      - Durasi sewa
      - Keperluan sewa
      - Harga yang diajukan
    - **Dokumen Pendukung:**
      - KTP (preview/download)
      - Surat Domisili (preview/download)
      - Dokumen lain (preview/download)
    - **Timeline:**
      - Waktu submission
      - History status change
    - **Action Buttons:**
      - [✓ APPROVE]
      - [✗ REJECT]
      - [📝 EDIT] (untuk admin ubah data jika diperlukan)

- **Aksi 6: Verify Dokumen**
  - Admin bisa preview semua dokumen yang diupload
  - Cek:
    - KTP valid dan jelas?
    - Surat Domisili valid dan jelas?
    - Data di dokumen sesuai dengan form?
  - Admin bisa flag dokumen sebagai:
    - ✓ Valid
    - ? Unclear (perlu clarification)
    - ✗ Invalid (perlu re-upload)

- **Aksi 7: Approve Permohonan**
  - Admin klik "[✓ APPROVE]"
  - Confirmation dialog: "Approve permohonan ini?"
  - Admin masukkan catatan (optional): "Dokumen lengkap, aset tersedia"
  - Jika approve:
    - Status permohonan = DISETUJUI
    - Sistem otomatis:
      - Generate perjanjian (Agreement)
      - Generate tagihan berdasarkan harga
      - Kirim notifikasi ke user
    - Tampilkan: "Permohonan berhasil disetujui"

- **Aksi 8: Reject Permohonan**
  - Admin klik "[✗ REJECT]"
  - Form dialog muncul untuk input alasan:
    - Dropdown alasan reject (Dokumen tidak lengkap, Data tidak valid, Aset tidak tersedia, dll)
    - Text field untuk penjelasan detail
  - Admin input alasan & detail
  - Jika reject:
    - Status permohonan = DITOLAK
    - Catatan reject disimpan di database
    - User dikirim notifikasi dengan alasan

- **Aksi 9: Lihat Riwayat Permohonan**
  - Admin bisa lihat riwayat permohonan per user
  - Lihat pattern: user ini sering approve atau sering reject?

- **Aksi 10: Bulk Action** (optional advanced feature)
  - Admin select multiple permohonan
  - Bulk action: Approve All, Reject All

**Data yang Ditampilkan:**
- Request ID, Request Number, Status
- User Name, User Email, User ID Number
- Asset Name, Start Date, End Date
- Purpose, Total Price
- Document URLs & Status
- Submission Time
- Admin Notes (jika ada)
- Approval Status & Timestamp (jika sudah approve/reject)

---

### 4. 📜 Halaman Monitoring Perjanjian & Tagihan (Admin)

**Lokasi di App:** Menu → Perjanjian & Tagihan

**UI Layout:**
```
┌──────────────────────────────┐
│  PERJANJIAN & TAGIHAN        │
│  [Tab: Perjanjian|Tagihan]   │
├──────────────────────────────┤
│  PERJANJIAN (Tab)            │
│  [Filter: AKTIF/SELESAI]     │
│  ┌────────────────────────┐  │
│  │ AGR-001                │  │
│  │ John Doe               │  │
│  │ Ruang Kantor Lantai 1  │  │
│  │ 15 Apr - 30 Apr 2026   │  │
│  │ Status: AKTIF ✓        │  │
│  │ [View Detail] [End]    │  │
│  └────────────────────────┘  │
│                              │
│  TAGIHAN (Tab)               │
│  [Filter: Belum Bayar/Lunas] │
│  ┌────────────────────────┐  │
│  │ INV-001                │  │
│  │ John Doe               │  │
│  │ Rp 5.000.000           │  │
│  │ Jatuh Tempo: 25 Apr    │  │
│  │ Status: BELUM BAYAR 🔴 │  │
│  │ [Reminder] [Mark Paid] │  │
│  └────────────────────────┘  │
│  ┌────────────────────────┐  │
│  │ INV-002                │  │
│  │ Jane Smith             │  │
│  │ Rp 2.500.000           │  │
│  │ Jatuh Tempo: 5 May     │  │
│  │ Status: LUNAS ✓        │  │
│  │ [View Detail]          │  │
│  └────────────────────────┘  │
└──────────────────────────────┘
```

**Apa yang Admin Bisa Lakukan:**

- **Aksi 1: Lihat Daftar Perjanjian**
  - Sistem load semua perjanjian
  - Tampilkan dalam list grouped by status
  - Setiap perjanjian tampilkan:
    - Nomor perjanjian
    - Nama penyewa (user)
    - Aset yang disewa
    - Tanggal berlaku
    - Status (AKTIF / SELESAI /EXPIRED)
    - Tombol action

- **Aksi 2: Filter Perjanjian by Status**
  - Filter: AKTIF, SELESAI, EXPIRED
  - Tampilkan hanya status terpilih

- **Aksi 3: Lihat Detail Perjanjian**
  - Admin klik "View Detail"
  - Tampilkan:
    - Informasi perjanjian lengkap
    - Penyewa data
    - Aset yang disewa
    - Tanggal valid
    - Harga disepakati
    - Dokumen perjanjian (PDF)
    - Tagihan terkait
    - Timeline

- **Aksi 4: End Agreement (Tanpa Menunggu Waktu Habis)**
  - Admin bisa klik "[End]" untuk terminate agreement
  - Confirmation: "Akhiri perjanjian ini?"
  - Catatan (optional)
  - Jika confirm:
    - Status perjanjian = SELESAI
    - Tagihan otomatis di-finalize
    - User dikirim notifikasi

- **Aksi 5: Lihat Daftar Tagihan**
  - Tab "Tagihan" menampilkan semua invoice
  - Tampilkan:
    - Nomor tagihan
    - User/Penyewa
    - Perjanjian terkait
    - Nominal
    - Jatuh tempo
    - Status (Belum Bayar / Lunas)

- **Aksi 6: Monitor Tagihan Pending**
  - Highlight tagihan yang sudah melewati due date
  - Tampilkan warning: "Tagihan Overdue 5 hari"
  - Sorting: Overdue items first

- **Aksi 7: Send Reminder**
  - Admin bisa klik "[Reminder]" pada tagihan belum bayar
  - Sistem kirim reminder email/SMS/push notif ke user
  - Notifikasi: "Tagihan INV-001 belum dibayar, due date XX"
  - Tracking: Tanggal reminder terakhir dikirim

- **Aksi 8: Mark Tagihan Sebagai Paid**
  - Jika user bayar via offline (transfer manual, tunai)
  - Admin bisa klik "[Mark Paid]"
  - Form muncul untuk input:
    - Tanggal pembayaran
    - Metode (Manual Transfer, Tunai, dll)
    - Nomor bukti/referensi
  - Sistem update:
    - Status tagihan = LUNAS
    - Bayar date = input date
    - Payment record dibuat
    - User dikirim notifikasi "Tagihan Anda sudah lunas"

- **Aksi 9: Generate Laporan Tagihan**
  - Admin bisa generate laporan:
    - Total tagihan outstanding
    - Total tagihan belum bayar per user
    - Over-due items
    - Revenue collected

**Data yang Ditampilkan:**
- Agreement ID, Agreement Number, Status
- Invoice ID, Invoice Number, Status
- User Name, User ID
- Asset Name
- Agreement Valid Date
- Invoice Due Date, Payment Status
- Amount
- Payment Method (jika sudah bayar)
- Payment Date
- Reference Number

---

### 5. 💳 Halaman Monitoring Pembayaran (Admin)

**Lokasi di App:** Menu → Pembayaran

**UI Layout:**
```
┌──────────────────────────────┐
│  MONITORING PEMBAYARAN       │
│  [Filter: All/Pending/Done]  │
│  [Filter: Today/Week/Month]  │
│  [Search] [Sort]             │
├──────────────────────────────┤
│  TODAY (2 Transactions)      │
│  ┌────────────────────────┐  │
│  │ TRX-0001 ✓             │  │
│  │ John Doe               │  │
│  │ Rp 5.000.000           │  │
│  │ VA: 123456789...       │  │
│  │ Waktu: 10:30 (2 jam)   │  │
│  │ [View Detail]          │  │
│  └────────────────────────┘  │
│  ┌────────────────────────┐  │
│  │ TRX-0002 ⏳            │  │
│  │ Jane Smith             │  │
│  │ Rp 2.500.000           │  │
│  │ VA: 987654321...       │  │
│  │ Waktu: 11:00 (1 jam)   │  │
│  │ [View Detail] [Confirm]│  │
│  └────────────────────────┘  │
│                              │
│  THIS WEEK (Revenue)         │
│  Total: Rp 127.500.000       │
└──────────────────────────────┘
```

**Apa yang Admin Bisa Lakukan:**

- **Aksi 1: Lihat Semua Transaksi Pembayaran**
  - Sistem load pembayaran dari payment gateway
  - Tampilkan dalam list grouped by tanggal
  - Setiap transaksi tampilkan:
    - ID transaksi
    - Nama user
    - Nominal
    - Nomor VA yang digunakan
    - Status (✓ Success / ⏳ Pending / ✗ Failed)
    - Waktu transaksi
    - Tombol action

- **Aksi 2: Filter by Status Pembayaran**
  - Filter: All, Success, Pending, Failed
  - Tampilkan hanya status terpilih

- **Aksi 3: Filter by Periode**
  - Filter periode:
    - Hari ini
    - 7 hari terakhir
    - 30 hari terakhir
    - Bulan (pilih bulan & tahun)
    - Custom date range
  - Sistem reload list sesuai filter

- **Aksi 4: Sort Pembayaran**
  - Sort pilihan:
    - Terbaru (default)
    - Tertua
    - Nominal Terbesar
    - Nominal Terkecil

- **Aksi 5: Search Pembayaran**
  - Admin bisa search:
    - Nama user
    - ID transaksi
    - Nominal
    - Nomor VA

- **Aksi 6: Lihat Detail Pembayaran**
  - Admin klik "View Detail"
  - Tampilkan:
    - Transaksi ID, Date & Time
    - User detail
    - Tagihan/Invoice terkait
    - Nomor VA
    - Nominal pembayaran
    - Status & timestamp confirm
    - Bank reference number
    - Payment method detail
    - Receipt

- **Aksi 7: Manual Confirm Pending Pembayaran**
  - Jika pembayaran status PENDING lebih dari 5 menit
  - Admin bisa klik "[Confirm]"
  - System re-check ke bank/gateway
  - Jika pembayaran sudah mas masuk:
    - Status auto-update jadi SUCCESS
    - User notified
    - Tagihan auto-update LUNAS
  - Jika belum ada pembayaran:
    - Status tetap PENDING
    - Notify admin untuk follow up

- **Aksi 8: Refund Pembayaran** (jika dapat approval special)
  - Admin bisa process refund jika ada issue
  - Form refund:
    - Transaksi ID
    - Alasan refund  
    - Jumlah refund
  - Konfirmasi dari supervisor
  - Sistem proses refund ke rekening user

- **Aksi 9: View Dashboard Pembayaran**
  - Summary pembayaran:
    - Total transaksi hari ini
    - Total nominal hari ini
    - Jumlah success
    - Jumlah pending
    - Jumlah failed

- **Aksi 10: Export Laporan Pembayaran**
  - Admin bisa export data pembayaran
  - Format: PDF, Excel
  - Filter & periode sesuai dengan tampilan saat ini

**Data yang Ditampilkan:**
- Transaction ID, Payment Date & Time
- User Name, User ID
- Invoice/Tagihan ID
- VA Number
- Amount
- Payment Status (SUCCESS/PENDING/FAILED)
- Bank Reference Number
- Payment Gateway Response
- Confirmation Time
- Receipt URL

---

### 6. 🏢 Halaman Manajemen Aset (Admin)

**Lokasi di App:** Menu → Aset

**Apa yang Admin Bisa Lakukan:**

- **Aksi 1: Lihat Daftar Semua Aset**
  - Tampilkan semua aset yang ada di sistem
  - Masing-masing aset tampilkan: nama, lokasi, status, fasilitas

- **Aksi 2: Buat Aset Baru**
  - Admin klik "[+ Create New Asset]"
  - Form muncul untuk input:
    - Nama aset
    - Deskripsi
    - Lokasi / Alamat
    - Kapasitas
    - Fasilitas (checkbox: AC, WiFi, Parking, dll)
    - Photo/Gallery (upload images)
    - Base Price (harga dasar referensi)
    - Status (AVAILABLE/UNAVAILABLE/MAINTENANCE)
  - Simpan → aset dibuat dengan ID unik

- **Aksi 3: Edit Aset**
  - Admin klik "[Edit]" pada aset
  - Bisa edit semua field (nama, deskrip, foto, fasilitas, status)
  - Simpan → aset di-update

- **Aksi 4: Ubah Status Aset**
  - Admin bisa ubah status ke:
    - AVAILABLE (bisa disewa)
    - UNAVAILABLE (sedang disewa/tidak tersedia)
    - MAINTENANCE (sedang perbaikan)
  - Update otomatis → user tidak bisa permohonan untuk aset non-AVAILABLE

- **Aksi 5: Upload Foto Aset**
  - Admin bisa upload gallery foto untuk aset
  - Bisa tambah caption per foto
  - Foto ditampilkan di halaman aset user

- **Aksi 6: Hapus Aset** (dengan warning)
  - Admin bisa hapus aset (soft delete)
  - Warning: "Aset akan tidak terlihat, tapi data sewa tetap tersimpan"
  - After delete → aset tidak muncul di user app

---

### 7. 💰 Halaman Manajemen Tarif (Admin)

**Lokasi di App:** Menu → Tarif

**Apa yang Admin Bisa Lakukan:**

- **Aksi 1: Lihat Daftar Tarif**
  - Tampilkan semua tarif grouped by aset
  - Masing-masing tarif tampilkan: nama, durasi, harga, DP%

- **Aksi 2: Buat Tarif Baru**
  - Admin klik "[+ Create Tariff]"
  - Form untuk input:
    - Asset (pilih aset untuk tarif ini)
    - Nama Tarif (misal: "Per Hari", "Per Bulan")
    - Duration (nilai durasi)
    - Duration Unit (Day/Week/Month/Year)
    - Price
    - Minimum Duration Sewa
    - DP Percentage
    - Descriptions & Terms
    - Document URL (format PDF untuk syarat)
  - Simpan → tarif dibuat

- **Aksi 3: Edit Tarif**
  - Admin klik "[Edit]" pada tarif
  - Edit: nama, price, DP%, descriptions
  - Simpan → tarif di-update
  - Historical: sistem track perubahan harga (untuk audit)

- **Aksi 4: Hapus Tarif**
  - Admin bisa hapus tarif (soft delete)
  - Tarif lama tetap tercatat untuk permohonan sebelumnya
  - Tarif tidak muncul sebagai pilihan user baru

- **Aksi 5: Create Promo**
  - Admin bisa buat promo untuk tarif tertentu
  - Promo yang sama jangan bisa double

---

### 8. 👥 Halaman Manajemen User (Admin)

**Lokasi di App:** Menu → User

**Apa yang Admin Bisa Lakukan:**

- **Aksi 1: Lihat Daftar User**
  - Tampilkan semua user (masyarakat/pengguna)
  - Masing-masing tampilkan: nama, email, telepon, status, total permohonan

- **Aksi 2: View Detail User**
  - Admin klik user untuk lihat profil lengkap
  - Tampilkan:
    - Biodata user
    - Total permohonan
    - Total pembayaran
    - Status verifikasi
    - Dokumentasi (KTP, Domisili)
    - History permohonan
    - History pembayaran

- **Aksi 3: Verify/Unverify Email User**
  - Admin bisa mark email sebagai verified/unverified
  - Jika unverify → user diminta verify ulang

- **Aksi 4: Suspend User Account**
  - Admin bisa suspend akun user (temporary ban)
  - User tidak bisa login saat akun suspend
  - Admin bisa unsuspend kapan saja

- **Aksi 5: Ban User Account**
  - Admin bisa ban akun user permanent
  - User tidak bisa akses aplikasi selamanya

---

### 9. ⚙️ Halaman Settings (Admin)

**Lokasi di App:** Menu → Settings

**Apa yang Admin Bisa Lakukan:**

- **Aksi 1: System Configuration**
  - Admin bisa atur:
    - Application name, logo
    - Default currency
    - Tax rate
    - Bank details untuk Virtual Account

- **Aksi 2: Email & Notification Template**
  - Admin bisa customize template email
  - Template: Approval notification, Reminder, Receipt, dll

- **Aksi 3: Bank Integration Settings**
  - Input bank details, routing numbers
  - Setup payment gateway credentials

- **Aksi 4: Admin User Management**
  - Lihat daftar admin lain
  - Create/delete admin account
  - Assign permissions per admin (if role-based)

---

## 📊 User Journey & Workflow

### Workflow 1: Permohonan Sewa - User Side

```
START
  ↓
User Login
  ↓
Dashboard → Lihat Ringkasan
  ↓
Menu → Aset Retribusi
  ↓
Browse & Pilih Aset
  ↓
Lihat Detail Aset & Tarif
  ↓
Menu → Permohonan Baru
  ↓
Fill Form: Aset, Tanggal, Dokumen
  ↓
Submit Permohonan
  ↓
Generate Nomor Ref (REQ-2026-XXXXX)
  ↓
Notif: "Permohonan diterima, nomor REQ-..."
  ↓
Menu → Lihat Permohonan
  ↓
Monitor Status:
  - Status BARU → Menunggu review
  - Status PROSES → Dalam verifikasi
  - Status DISETUJUI → Lanjut bayar
  - Status DITOLAK → Bisa ajukan ulang
  ↓
(If DISETUJUI)
  ↓
Menu → Perjanjian & Tagihan
  ↓
Lihat Detail Perjanjian
  ↓
Lihat Tagihan Terkait
  ↓
Klik "BAYAR"
  ↓
Generate VA
  ↓
User Transfer ke VA
  ↓
Pembayaran Terkonfirmasi (1-5 menit)
  ↓
Tagihan Status = LUNAS
  ↓
Notif: "Pembayaran berhasil!"
  ↓
Perjanjian Aktif
  ↓
Sewa dimulai sesuai tanggal
  ↓
END
```

### Workflow 2: Approval Permohonan - Admin Side

```
START
  ↓
Admin Login (dengan credentials khusus admin)
  ↓
Dashboard → Lihat Summary Permohonan
  ↓
Menu → Permohonan (Monitoring)
  ↓
Filter: BARU (default)
  ↓
List Permohonan BARU = 5 items
  ↓
Klik "Review" pada permohonan
  ↓
Halaman Detail:
  - Check identitas user (KTP, Domisili)
  - Verify dokumen valid & jelas
  - Check aset ketersediaan
  - Check harga sesuai tarif
  ↓
Pilih Action:
  
  APPROVE PATH:
    ↓ Klik "[✓ APPROVE]"
    ↓ Input catatan (optional)
    ↓ Confirm
    ↓ Sistem otomatis:
      - Status = DISETUJUI
      - Generate Perjanjian (AGR-XXXXX)
      - Generate Tagihan (INV-XXXXX)
      - Kirim notif ke user
    ↓
  
  REJECT PATH:
    ↓ Klik "[✗ REJECT]"
    ↓ Pilih alasan & input detail
    ↓ Confirm
    ↓ Sistem:
      - Status = DITOLAK
      - Kirim notif ke user dengan alasan
    ↓

  ↓
Back to List
  ↓
Status permohonan updated secara real-time
  ↓
END
```

---

## 📊 Data & Entitas Utama

### Entity Relationships

```
┌─────────────┐
│    USER     │  (Masyarakat / Petugas)
│─────────────│
│ user_id PK  │
│ name        │
│ email       │
│ phone       │
│ role        │  ← "USER" atau "ADMIN"
│ status      │  ← "ACTIVE", "SUSPEND", "BANNED"
│ created_at  │
└─────────────┘
       │ 1───N
       │
       ├────► ┌──────────────────┐
       │      │  REQUEST(Permohonan) │
       │      │──────────────────│
       │      │ request_id  PK   │
       │      │ request_number   │  REQ-2026-0001
       │      │ user_id     FK   │  ↱
       │      │ asset_id    FK   │  ↱
       │      │ start_date  │    │
       │      │ end_date    │    │
       │      │ purpose     │    │
       │      │ status      │    │  BARU/PROSES/DISETUJUI/DITOLAK
       │      │ created_at  │    │
       │      └──────────────────┘
       │             │ 1───1
       │             │
       │             ├────► ┌──────────────────┐
       │             │      │  AGREEMENT      │ (Perjanjian)
       │             │      │──────────────────│
       │             │      │ agreement_id PK │
       │             │      │agreement_number │  AGR-001
       │             │      │ user_id    FK   │
       │             │      │ asset_id   FK   │
       │             │      │ start_date      │
       │             │      │ end_date        │
       │             │      │ status          │  AKTIF/SELESAI
       │             │      │ total_price     │
       │             │      │ created_at      │
       │             │      └──────────────────┘
       │             │             │ 1───N
       │             │             │
       │             │             └────► ┌──────────────────┐
       │             │                    │    INVOICE      │ (Tagihan)
       │             │                    │──────────────────│
       │             │                    │ invoice_id  PK  │
       │             │                    │ invoice_number  │  INV-001
       │             │                    │ user_id    FK   │
       │             │                    │ agreement_id FK │
       │             │                    │ amount          │
       │             │                    │ due_date        │
       │             │                    │ status          │ BELUM_BAYAR/LUNAS
       │             │                    │ created_at      │
       │             │                    └──────────────────┘
       │             │                             │ 1───1
       │             │                             │
       │             │                             └────► ┌──────────────────┐
       │             │                                    │  PAYMENT        │
       │             │                                    │──────────────────│
       │             │                                    │ payment_id  PK  │
       │             │                                    │ invoice_id  FK  │
       │             │                                    │ user_id     FK  │
       │             │                                    │ amount          │
       │             │                                    │ va_number       │
       │             │                                    │ status          │ SUCCESS/PENDING/FAILED
       │             │                                    │ payment_date    │
       │             │                                    │ bank_ref        │
       │             │                                    │ created_at      │
       │             │                                    └──────────────────┘
       │             │
       │             └──► Linked to ASSET
       │
       ├────► ┌──────────────────┐
              │     ASSET        │ (Aset Retribusi)
              │──────────────────│
              │ asset_id     PK  │
              │ name             │
              │ description      │
              │ location         │
              │ photo_urls   []  │
              │ facilities   []  │
              │ capacity         │
              │ status           │  AVAILABLE/UNAVAILABLE/MAINTENANCE
              │ base_price       │
              │ created_at       │
              └──────────────────┘
                     │ 1───N
                     │
                     └─────► ┌──────────────────┐
                            │     TARIFF      │ (Tarif Sewa)
                            │──────────────────│
                            │ tariff_id   PK  │
                            │ asset_id    FK  │
                            │ name            │  "Per Hari" / "Per Bulan"
                            │ duration        │  1 / 30
                            │ duration_unit   │  "day" / "month"
                            │ price           │
                            │ min_duration    │
                            │ dp_percentage   │
                            │ document_url    │  Link PDF
                            │ status          │  ACTIVE/INACTIVE
                            │ created_at      │
                            └──────────────────┘

┌──────────────────┐
│   DOCUMENT       │  (Dokumen Lampiran)
│──────────────────│
│ document_id  PK  │
│ request_id   FK  │  (linked ke permohonan)
│ doc_type         │  "KTP" / "DOMISILI" / "LAINNYA"
│ file_url         │
│ upload_date      │
└──────────────────┘

┌──────────────────┐
│   ADMIN_LOG      │  (Activity Log untuk audit)
│──────────────────│
│ log_id       PK  │
│ admin_id     FK  │
│ action           │  "APPROVE" / "REJECT" / "CREATE" / etc
│ target_id        │  ID dari entity yang di-action
│ target_type      │  "REQUEST" / "PAYMENT" / "USER" / etc
│ notes            │
│ timestamp        │
└──────────────────┘
```

---

## 📝 Summary & Key Takeaways

### Untuk User/Masyarakat:

TAPATUPA menyediakan **end-to-end journey** dari melihat aset → buat permohonan → approval → pembayaran online → monitoring.

Setiap halaman dirancang untuk **simple & user-friendly** dengan minimal friction.

Transparansi tinggi: user bisa track status permohonan real-time, bisa lihat detail perjanjian, tagihan, dan history pembayaran.

### Untuk Admin/Petugas:

TAPATUPA menyediakan **comprehensive monitoring dashboard** untuk mengelola semua permohonan, perjanjian, tagihan, dan pembayaran dari satu tempat.

Admin bisa **approve/reject** dengan mudah, dan sistem otomatis membuat perjanjian + tagihan.

Realtime coverage: dashboard menampilkan stats terakhir, admin bisa monitor pembayaran & aset utilization.

---

**Dokumen Ini Created:** 2 April 2026
**Status:** ✅ Final - Comprehensive Project Concept Documentation
