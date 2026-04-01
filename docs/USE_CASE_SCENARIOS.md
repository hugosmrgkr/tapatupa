# Use Case Scenarios — TAPATUPA (berdasarkan struktur code)

> Cara melihat seperti **laporan (bukan source markdown)** di VS Code:
>
> - Buka file ini, lalu tekan **Ctrl+Shift+V** (Markdown: Open Preview).
> - Atau klik kanan tab file → **Open Preview to the Side**.
>
> (Opsional) Untuk dijadikan PDF: buka Preview → Print (atau pakai ekstensi “Markdown PDF”).

Dokumen ini merangkum use case scenario untuk 2 role:

- **Masyarakat (Pengguna)**
- **Petugas Lapangan (Admin)**

Format tabel mengikuti contoh yang kamu kirim.

## Use Case Diagram

```mermaid
flowchart LR
	M["<<actor>> Masyarakat"]
	A["<<actor>> Petugas Lapangan (Admin)"]
	PG["<<actor>> Payment Gateway"]
	B["<<actor>> Bank"]

	UC01(["UC-01 Login"])
	UC02(["UC-02 Registrasi"])
	UC03(["UC-03 Dashboard Home"])
	UC04(["UC-04 Lihat Aset Retribusi"])
	UC05(["UC-05 Lihat Tarif Sewa"])
	UC06(["UC-06 Buat Permohonan Sewa"])
	UC07(["UC-07 Lihat Daftar Permohonan"])
	UC08(["UC-08 Lihat Perjanjian & Tagihan"])
	UC09(["UC-09 Bayar Tagihan (VA Otomatis)"])
	UC10(["UC-10 Lihat Riwayat Pembayaran"])
	UC11(["UC-11 Profile & Logout"])

	UCA1(["UC-A1 Login Admin"])
	UCA2(["UC-A2 Dashboard Admin & Navigasi"])
	UCA3(["UC-A3 Monitoring Permohonan"])
	UCA4(["UC-A4 Monitoring Perjanjian & Tagihan"])
	UCA5(["UC-A5 Monitoring Pembayaran"])

	M --> UC01
	M --> UC02
	M --> UC03
	M --> UC04
	M --> UC05
	M --> UC06
	M --> UC07
	M --> UC08
	M --> UC09
	M --> UC10
	M --> UC11

	PG --> UC09
	B --> UC09

	A --> UCA1
	A --> UCA2
	A --> UCA3
	A --> UCA4
	A --> UCA5
```

---

## UC-01 — 🔐 Login

**Tabel 3.1. Use Case Scenario Masyarakat Login**

| Elemen               | Isi                                                                 |
| -------------------- | ------------------------------------------------------------------- |
| Use Case ID          | UC-01                                                               |
| Use Case Name        | Login                                                               |
| Use Case Description | Validasi username & password, memperoleh token, dan menyimpan sesi. |
| Primary Actor        | Masyarakat                                                          |
| Secondary Actor      | Sistem                                                              |
| Precondition         | 1. Pengguna berada di halaman login<br>2. Koneksi internet tersedia  |
| Post Condition       | Pengguna login dan token/sesi tersimpan                             |
| Related Use Case     | UC-02, UC-03                                                        |

| Flow                     | User Action                                | System Response                                                       |
| ------------------------ | ------------------------------------------ | --------------------------------------------------------------------- |
| Primary Flow of Events   | 1. Pengguna mengisi username & password.   | 2. Sistem memvalidasi input dan mengirim permintaan login ke server.  |
|                          | 3. Pengguna menekan tombol “Masuk”.        | 4. Sistem menerima token dan menyimpan sesi (cache/penyimpanan lokal). |
|                          |                                            | 5. Sistem mengarahkan pengguna ke dashboard home.                      |
| Alternate Flow of Events | Pengguna memilih menu registrasi.          | Sistem mengarahkan pengguna ke halaman registrasi.                    |
| Error Flow of Events     | Kredensial salah / server menolak login.   | Sistem menampilkan pesan gagal login.                                  |
|                          | Gangguan jaringan.                         | Sistem menampilkan pesan error dan meminta coba lagi.                  |

---

## UC-02 — 📝 Registrasi

**Tabel 3.2. Use Case Scenario Masyarakat Registrasi**

| Elemen               | Isi                                                                                   |
| -------------------- | ------------------------------------------------------------------------------------- |
| Use Case ID          | UC-02                                                                                 |
| Use Case Name        | Registrasi                                                                            |
| Use Case Description | Daftar akun baru dengan data identitas & akun, lalu diarahkan ke login jika sukses.  |
| Primary Actor        | Masyarakat                                                                            |
| Secondary Actor      | Sistem                                                                                |
| Precondition         | User belum punya akun<br>Koneksi internet tersedia                                    |
| Post Condition       | Akun tercipta dan pengguna dapat melakukan login                                      |
| Related Use Case     | UC-01                                                                                 |

| Flow                     | User Action                                                             | System Response                                                                |
| ------------------------ | ----------------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| Primary Flow of Events   | 1. Pengguna membuka halaman registrasi.                                 | 2. Sistem menampilkan form registrasi.                                         |
|                          | 3. Pengguna mengisi data identitas & akun, lalu menekan “Daftar”.       | 4. Sistem memvalidasi input dan mengirim permintaan registrasi ke server.      |
|                          |                                                                         | 5. Jika sukses, sistem menampilkan notifikasi dan mengarahkan ke halaman login. |
| Alternate Flow of Events | Pengguna membatalkan registrasi.                                        | Sistem kembali ke halaman login.                                               |
| Error Flow of Events     | Data tidak valid / server menolak registrasi.                           | Sistem menampilkan pesan kesalahan dan meminta perbaikan input.                |

---

## UC-03 — 🏠 Dashboard Home

**Tabel 3.3. Use Case Scenario Masyarakat Mengakses Dashboard Home**

| Elemen               | Isi                                                                                               |
| -------------------- | ------------------------------------------------------------------------------------------------- |
| Use Case ID          | UC-03                                                                                             |
| Use Case Name        | Dashboard Home                                                                                    |
| Use Case Description | Menampilkan ringkasan (mis. tagihan terbaru, status permohonan) dan menu utama untuk akses fitur. |
| Primary Actor        | Masyarakat                                                                                        |
| Secondary Actor      | Sistem                                                                                            |
| Precondition         | Login sukses (sesi/token valid)                                                                   |
| Post Condition       | Dashboard ditampilkan                                                                             |
| Related Use Case     | UC-04 s/d UC-11                                                                                   |

| Flow                     | User Action                                      | System Response                                                                |
| ------------------------ | ------------------------------------------------ | ------------------------------------------------------------------------------ |
| Primary Flow of Events   | 1. Pengguna masuk ke halaman home setelah login. | 2. Sistem memuat data ringkasan yang tersedia dan menampilkan menu navigasi.   |
|                          | 3. Pengguna memilih menu utama (Aset/Tarif/Permohonan/Tagihan/Pembayaran/Profile). | 4. Sistem membuka halaman sesuai menu yang dipilih. |
| Error Flow of Events     | Sesi tidak valid saat memuat ringkasan.          | Sistem mengarahkan pengguna kembali ke login.                                  |

---

## UC-04 — 🏢 Lihat Aset Retribusi

**Tabel 3.4. Use Case Scenario Masyarakat Melihat Aset Retribusi**

| Elemen               | Isi                                                                                 |
| -------------------- | ----------------------------------------------------------------------------------- |
| Use Case ID          | UC-04                                                                               |
| Use Case Name        | Lihat Aset Retribusi                                                                |
| Use Case Description | Mengambil daftar aset dari server dan menampilkan informasi (foto, nama, lokasi, status). |
| Primary Actor        | Masyarakat                                                                          |
| Secondary Actor      | Sistem                                                                              |
| Precondition         | Login                                                                               |
| Post Condition       | Daftar aset tampil                                                                  |
| Related Use Case     | UC-05, UC-06                                                                        |

| Flow                     | User Action                                   | System Response                                                        |
| ------------------------ | --------------------------------------------- | ---------------------------------------------------------------------- |
| Primary Flow of Events   | 1. Pengguna membuka menu Aset Retribusi.      | 2. Sistem memanggil API list aset dan menampilkan daftar.              |
|                          | 3. Pengguna memilih salah satu aset.          | 4. Sistem menampilkan detail aset (jika tersedia).                     |
| Error Flow of Events     | Gagal memuat data (network/server).           | Sistem menampilkan pesan gagal memuat dan opsi coba lagi.              |

---

## UC-05 — 💰 Lihat Tarif Sewa

**Tabel 3.5. Use Case Scenario Masyarakat Melihat Tarif Sewa**

| Elemen               | Isi                                                                 |
| -------------------- | ------------------------------------------------------------------- |
| Use Case ID          | UC-05                                                               |
| Use Case Name        | Lihat Tarif Sewa                                                    |
| Use Case Description | Mengambil daftar tarif dari server dan menampilkan harga per tipe/durasi. |
| Primary Actor        | Masyarakat                                                          |
| Secondary Actor      | Sistem                                                              |
| Precondition         | Login                                                               |
| Post Condition       | Daftar tarif tampil                                                  |
| Related Use Case     | UC-04, UC-06                                                        |

| Flow                     | User Action                             | System Response                                                   |
| ------------------------ | --------------------------------------- | --------------------------------------------------------------- |
| Primary Flow of Events   | 1. Pengguna membuka menu Tarif Sewa.    | 2. Sistem memanggil API tarif dan menampilkan daftar tarif.      |
|                          | 3. Pengguna memilih salah satu tarif.   | 4. Sistem menampilkan detail tarif dan dokumen (jika tersedia).  |
| Error Flow of Events     | Gagal memuat data tarif.                | Sistem menampilkan pesan error.                                  |

---

## UC-06 — 📋 Buat Permohonan Sewa

**Tabel 3.6. Use Case Scenario Masyarakat Membuat Permohonan Sewa**

| Elemen               | Isi                                                                                                  |
| -------------------- | ---------------------------------------------------------------------------------------------------- |
| Use Case ID          | UC-06                                                                                                |
| Use Case Name        | Buat Permohonan Sewa                                                                                 |
| Use Case Description | Mengisi form (objek, durasi, keperluan) dan mengunggah dokumen pendukung (mis. KTP, domisili, surat), lalu mengirim ke server. |
| Primary Actor        | Masyarakat                                                                                           |
| Secondary Actor      | Sistem                                                                                               |
| Precondition         | Login, aset dipilih/diketahui<br>Dokumen pendukung tersedia (mis. KTP/domisili/surat)                |
| Post Condition       | Permohonan tercatat di sistem (mis. status awal BARU/menunggu proses) dan dapat dimonitor admin      |
| Related Use Case     | UC-07, UC-A3                                                                                         |

| Flow                     | User Action                                                     | System Response                                                                 |
| ------------------------ | --------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| Primary Flow of Events   | 1. Pengguna membuka menu Buat Permohonan.                        | 2. Sistem menampilkan form dan memuat data pendukung (dropdown/list).           |
|                          | 3. Pengguna mengisi field dan memilih objek/durasi/keperluan.     | 4. Sistem memvalidasi input.                                                    |
|                          | 5. Pengguna memilih & mengunggah dokumen pendukung.               | 6. Sistem menyiapkan upload dan memvalidasi kelengkapan dokumen.                |
|                          | 7. Pengguna menekan “Kirim”.                                      | 8. Sistem mengirim permohonan (multipart) ke server dan menampilkan hasil.      |
| Error Flow of Events     | Dokumen/field tidak lengkap atau upload gagal.                    | Sistem menampilkan pesan kesalahan dan permohonan tidak tersimpan.              |

---

## UC-07 — 📌 Lihat Daftar Permohonan

**Tabel 3.7. Use Case Scenario Masyarakat Melihat Daftar Permohonan**

| Elemen               | Isi                                                                 |
| -------------------- | ------------------------------------------------------------------- |
| Use Case ID          | UC-07                                                               |
| Use Case Name        | Lihat Daftar Permohonan                                             |
| Use Case Description | Mengambil daftar permohonan milik user dan menampilkan statusnya.   |
| Primary Actor        | Masyarakat                                                          |
| Secondary Actor      | Sistem                                                              |
| Precondition         | Permohonan sudah dibuat (UC-06)                                     |
| Post Condition       | List permohonan tampil                                              |
| Related Use Case     | UC-08                                                               |

| Flow                     | User Action                                  | System Response                                                       |
| ------------------------ | -------------------------------------------- | --------------------------------------------------------------------- |
| Primary Flow of Events   | 1. Pengguna membuka menu Permohonan.         | 2. Sistem memanggil API daftar permohonan dan menampilkan list + status. |
|                          | 3. Pengguna memilih salah satu permohonan.   | 4. Sistem menampilkan detail permohonan (jika tersedia).               |
| Error Flow of Events     | Gagal memuat daftar.                         | Sistem menampilkan pesan error.                                        |

---

## UC-08 — 📜 Lihat Perjanjian & Tagihan

**Tabel 3.8. Use Case Scenario Masyarakat Melihat Perjanjian dan Tagihan**

| Elemen               | Isi                                                                 |
| -------------------- | ------------------------------------------------------------------- |
| Use Case ID          | UC-08                                                               |
| Use Case Name        | Lihat Perjanjian & Tagihan                                          |
| Use Case Description | Melihat perjanjian aktif dan tagihan terkait, termasuk akses detail dan tombol bayar. |
| Primary Actor        | Masyarakat                                                          |
| Secondary Actor      | Sistem                                                              |
| Precondition         | Perjanjian/tagihan tersedia di akun pengguna                        |
| Post Condition       | Daftar perjanjian & tagihan tampil                                  |
| Related Use Case     | UC-09, UC-10, UC-A4                                                 |

| Flow                     | User Action                                      | System Response                                                           |
| ------------------------ | ------------------------------------------------ | ------------------------------------------------------------------------- |
| Primary Flow of Events   | 1. Pengguna membuka menu Perjanjian/Tagihan.     | 2. Sistem memanggil API perjanjian & tagihan dan menampilkan daftar.      |
|                          | 3. Pengguna memilih item untuk melihat detail.   | 4. Sistem menampilkan detail dan status (mis. BELUM BAYAR/LUNAS).         |
| Alternate Flow of Events | Tidak ada data perjanjian/tagihan.               | Sistem menampilkan informasi data kosong.                                 |
| Error Flow of Events     | Gagal memuat data.                               | Sistem menampilkan pesan error.                                           |

---

## UC-09 — 💳 Bayar Tagihan (VA Otomatis)

**Tabel 3.9. Use Case Scenario Masyarakat Membayar Tagihan via VA**

| Elemen               | Isi                                                                 |
| -------------------- | ------------------------------------------------------------------- |
| Use Case ID          | UC-09                                                               |
| Use Case Name        | Bayar Tagihan (Virtual Account)                                     |
| Use Case Description | Pengguna memilih tagihan dan melakukan pembayaran menggunakan nomor Virtual Account, lalu status diperbarui otomatis oleh sistem. |
| Primary Actor        | Masyarakat                                                          |
| Secondary Actor      | Sistem, Payment Gateway, Bank                                       |
| Precondition         | Tagihan status BELUM BAYAR                                          |
| Post Condition       | Status pembayaran menjadi LUNAS/berhasil (jika pembayaran sukses) dan bukti pembayaran tersedia (jika disediakan sistem) |
| Related Use Case     | UC-10, UC-A5                                                        |

| Flow                     | User Action                                                              | System Response                                                                 |
| ------------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------------------------- |
| Primary Flow of Events   | 1. Pengguna menekan tombol “Bayar” pada tagihan.                         | 2. Sistem menyiapkan transaksi pembayaran dan menampilkan nomor VA & instruksi. |
|                          | 3. Pengguna melakukan transfer/pembayaran melalui kanal bank menggunakan nomor VA. | 4. Sistem memonitor status pembayaran (mis. melalui pengecekan status berkala). |
|                          |                                                                          | 5. Jika pembayaran terkonfirmasi, sistem memperbarui status tagihan menjadi LUNAS dan menampilkan/memperbarui bukti pembayaran (jika tersedia). |
| Alternate Flow of Events | Pengguna tidak jadi membayar sampai batas waktu.                         | Sistem menandai transaksi expired (jika ada batas waktu).                       |
| Error Flow of Events     | Gagal menyiapkan transaksi / gagal cek status.                            | Sistem menampilkan pesan error dan menyediakan opsi coba lagi.                  |

---

## UC-10 — 🧾 Lihat Riwayat Pembayaran

**Tabel 3.10. Use Case Scenario Masyarakat Melihat Riwayat Pembayaran**

| Elemen               | Isi                                                                 |
| -------------------- | ------------------------------------------------------------------- |
| Use Case ID          | UC-10                                                               |
| Use Case Name        | Lihat Riwayat Pembayaran                                            |
| Use Case Description | Menampilkan daftar pembayaran yang sudah berhasil/lunas dan detail transaksi. |
| Primary Actor        | Masyarakat                                                          |
| Secondary Actor      | Sistem                                                              |
| Precondition         | Minimal satu pembayaran berhasil/lunas (UC-09)                       |
| Post Condition       | List pembayaran tampil                                               |
| Related Use Case     | -                                                                   |

| Flow                     | User Action                                  | System Response                                                      |
| ------------------------ | -------------------------------------------- | -------------------------------------------------------------------- |
| Primary Flow of Events   | 1. Pengguna membuka menu Riwayat Pembayaran. | 2. Sistem memanggil API riwayat pembayaran dan menampilkan daftar.   |
|                          | 3. Pengguna memilih salah satu item.         | 4. Sistem menampilkan detail pembayaran (ref, tanggal, nominal, dll). |
| Alternate Flow of Events | Tidak ada riwayat pembayaran.                | Sistem menampilkan informasi data kosong.                             |
| Error Flow of Events     | Gagal memuat data.                           | Sistem menampilkan pesan error.                                       |

---

## UC-11 — 👤 Profile & Logout

**Tabel 3.11. Use Case Scenario Masyarakat Profile dan Logout**

| Elemen               | Isi                                                                 |
| -------------------- | ------------------------------------------------------------------- |
| Use Case ID          | UC-11                                                               |
| Use Case Name        | Profile & Logout                                                    |
| Use Case Description | Melihat informasi profil yang tersedia, (opsional) memperbarui profil jika disediakan, dan logout (hapus sesi). |
| Primary Actor        | Masyarakat                                                          |
| Secondary Actor      | Sistem                                                              |
| Precondition         | Login                                                               |
| Post Condition       | Session clear dan redirect ke login (jika logout)                   |
| Related Use Case     | UC-01                                                               |

| Flow                     | User Action                          | System Response                                                     |
| ------------------------ | ------------------------------------ | ------------------------------------------------------------------- |
| Primary Flow of Events   | 1. Pengguna membuka menu Profile.    | 2. Sistem menampilkan data profil yang tersedia.                    |
|                          | 3. Pengguna menekan tombol “Logout”. | 4. Sistem menghapus sesi lokal dan mengarahkan pengguna ke login.   |
| Alternate Flow of Events | Pengguna mengubah data profil (jika fitur tersedia). | Sistem menyimpan perubahan dan menampilkan hasil/peringatan validasi. |
|                          | Pengguna kembali tanpa logout.       | Sistem kembali ke halaman sebelumnya.                               |
| Error Flow of Events     | Gagal memuat sebagian data profil.   | Sistem tetap tampilkan data yang ada dan menandai field yang kosong. |

---

# Use Case Scenarios — Petugas Lapangan (Admin)

## UC-A1 — Login Admin

**Tabel 3.12. Use Case Scenario Petugas Melakukan Login Admin**

| Elemen               | Isi                                                                                                      |
| -------------------- | -------------------------------------------------------------------------------------------------------- |
| Use Case ID          | UC-A1                                                                                                    |
| Use Case Name        | Login Admin                                                                                              |
| Use Case Description | Use case ini menjelaskan petugas lapangan login sebagai admin (petugas) untuk mengakses dashboard admin. |
| Primary Actor        | Petugas Lapangan                                                                                         |
| Secondary Actor      | Sistem                                                                                                   |
| Precondition         | 1. Petugas berada di halaman login<br>2. Kredensial admin tersedia                                       |

| Flow                     | User Action                                     | System Response                                                    |
| ------------------------ | ----------------------------------------------- | ------------------------------------------------------------------ |
| Primary Flow of Events   | 1. Petugas mengisi username dan password admin. | 2. Sistem memvalidasi kredensial admin.                            |
|                          | 3. Petugas menekan tombol “Masuk”.              | 4. Sistem menyimpan sesi admin dan mengarahkan ke dashboard admin. |
| Alternate Flow of Events | Petugas memilih login sebagai user biasa.       | Sistem mengikuti alur login user.                                  |
| Error Flow of Events     | Kredensial admin salah.                         | Sistem menampilkan pesan gagal login.                              |
| Post Condition           |                                                 | Petugas berada di dashboard admin.                                 |

---

## UC-A2 — Dashboard Admin & Navigasi

**Tabel 3.13. Use Case Scenario Petugas Mengakses Dashboard Admin**

| Elemen               | Isi                                                                                                                           |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| Use Case ID          | UC-A2                                                                                                                         |
| Use Case Name        | Dashboard Admin                                                                                                               |
| Use Case Description | Use case ini menjelaskan petugas mengakses dashboard admin dan berpindah menu monitoring menggunakan bottom navigation admin. |
| Primary Actor        | Petugas Lapangan                                                                                                              |
| Secondary Actor      | Sistem                                                                                                                        |
| Precondition         | 1. Petugas sudah login admin                                                                                                  |

| Flow                     | User Action                                              | System Response                                        |
| ------------------------ | -------------------------------------------------------- | ------------------------------------------------------ |
| Primary Flow of Events   | 1. Petugas membuka dashboard admin.                      | 2. Sistem menampilkan halaman admin dan menu navigasi. |
|                          | 3. Petugas memilih menu (Permohonan/Tagihan/Pembayaran). | 4. Sistem menampilkan halaman sesuai menu.             |
| Alternate Flow of Events | Petugas kembali ke menu sebelumnya.                      | Sistem menampilkan halaman sebelumnya.                 |
| Error Flow of Events     | Sesi admin habis/unauthorized.                           | Sistem mengarahkan petugas ke login.                   |
| Post Condition           |                                                          | Petugas berada pada modul admin yang dipilih.          |

---

## UC-A3 — Monitoring Permohonan

**Tabel 3.14. Use Case Scenario Petugas Melihat Daftar Permohonan**

| Elemen               | Isi                                                                               |
| -------------------- | --------------------------------------------------------------------------------- |
| Use Case ID          | UC-A3                                                                             |
| Use Case Name        | Monitoring Permohonan                                                             |
| Use Case Description | Use case ini menjelaskan petugas melihat daftar permohonan sewa untuk monitoring. |
| Primary Actor        | Petugas Lapangan                                                                  |
| Secondary Actor      | Sistem                                                                            |
| Precondition         | 1. Petugas sudah login admin<br>2. Koneksi internet tersedia                      |

| Flow                     | User Action                               | System Response                                                              |
| ------------------------ | ----------------------------------------- | ---------------------------------------------------------------------------- |
| Primary Flow of Events   | 1. Petugas membuka modul Permohonan.      | 2. Sistem memanggil API dan menampilkan daftar permohonan.                   |
|                          | 3. Petugas memilih salah satu permohonan. | 4. Sistem menampilkan detail (jika halaman detail tersedia pada alur admin). |
| Alternate Flow of Events | Tidak ada data permohonan.                | Sistem menampilkan data kosong.                                              |
| Error Flow of Events     | Gagal memuat data.                        | Sistem menampilkan pesan error.                                              |
| Post Condition           |                                           | Daftar permohonan tampil untuk monitoring.                                   |

---

## UC-A4 — Monitoring Perjanjian & Tagihan

**Tabel 3.15. Use Case Scenario Petugas Melihat Perjanjian dan Tagihan**

| Elemen               | Isi                                                                                                            |
| -------------------- | -------------------------------------------------------------------------------------------------------------- |
| Use Case ID          | UC-A4                                                                                                          |
| Use Case Name        | Monitoring Perjanjian & Tagihan                                                                                |
| Use Case Description | Use case ini menjelaskan petugas melihat daftar perjanjian dan/atau tagihan terkait untuk monitoring lapangan. |
| Primary Actor        | Petugas Lapangan                                                                                               |
| Secondary Actor      | Sistem                                                                                                         |
| Precondition         | 1. Petugas sudah login admin<br>2. Koneksi internet tersedia                                                   |

| Flow                     | User Action                                       | System Response                                      |
| ------------------------ | ------------------------------------------------- | ---------------------------------------------------- |
| Primary Flow of Events   | 1. Petugas membuka modul Tagihan atau Perjanjian. | 2. Sistem memanggil API dan menampilkan daftar data. |
|                          | 3. Petugas memilih item untuk melihat detail.     | 4. Sistem menampilkan detail tagihan/perjanjian.     |
| Alternate Flow of Events | Data kosong.                                      | Sistem menampilkan data kosong.                      |
| Error Flow of Events     | Gagal memuat data.                                | Sistem menampilkan pesan error.                      |
| Post Condition           |                                                   | Data perjanjian/tagihan tampil untuk monitoring.     |

---

## UC-A5 — Monitoring Pembayaran

**Tabel 3.16. Use Case Scenario Petugas Memonitor Pembayaran**

| Elemen               | Isi                                                                                                      |
| -------------------- | -------------------------------------------------------------------------------------------------------- |
| Use Case ID          | UC-A5                                                                                                    |
| Use Case Name        | Monitoring Pembayaran                                                                                    |
| Use Case Description | Use case ini menjelaskan petugas melihat daftar pembayaran dan status pembayaran aktif untuk monitoring. |
| Primary Actor        | Petugas Lapangan                                                                                         |
| Secondary Actor      | Sistem                                                                                                   |
| Precondition         | 1. Petugas sudah login admin<br>2. Koneksi internet tersedia                                             |

| Flow                     | User Action                                   | System Response                                                              |
| ------------------------ | --------------------------------------------- | ---------------------------------------------------------------------------- |
| Primary Flow of Events   | 1. Petugas membuka modul Pembayaran.          | 2. Sistem memanggil API pembayaran dan menampilkan daftar status pembayaran. |
|                          | 3. Petugas melihat pembayaran aktif/menunggu. | 4. Sistem menampilkan card pembayaran aktif (jika ada).                      |
| Alternate Flow of Events | Tidak ada riwayat pembayaran.                 | Sistem menampilkan data kosong.                                              |
| Error Flow of Events     | Gagal memuat data pembayaran.                 | Sistem menampilkan pesan error.                                              |
| Post Condition           |                                               | Informasi pembayaran tampil untuk monitoring.                                |
