# Aset Service API

Backend API service untuk aplikasi manajemen aset (retribusi) berbasis Laravel 11.

## Persyaratan

- PHP >= 8.2
- PostgreSQL >= 14
- Composer

## Instalasi

1. **Clone dan masuk ke direktori:**
   ```bash
   cd services/aset-service
   ```

2. **Install dependensi:**
   ```bash
   composer install
   ```

3. **Salin file environment:**
   ```bash
   cp .env.example .env
   ```

4. **Edit `.env` sesuai konfigurasi database Anda**

5. **Generate application key:**
   ```bash
   php artisan key:generate
   ```

6. **Generate JWT secret:**
   ```bash
   php artisan jwt:secret
   ```

7. **Jalankan migrasi dan seeder:**
   ```bash
   php artisan migrate --seed
   ```

8. **Buat symlink storage:**
   ```bash
   php artisan storage:link
   ```

9. **Jalankan server:**
   ```bash
   php artisan serve
   ```

## Menjalankan dengan Docker

```bash
docker-compose up -d
docker-compose exec app php artisan key:generate
docker-compose exec app php artisan jwt:secret
docker-compose exec app php artisan migrate --seed
docker-compose exec app php artisan storage:link
```

## API Endpoints

Semua request memerlukan header:
- `Vendor-ID: 2kadMK7vwBQp9tDEd2OqvSxuPYimFQoK`
- `Authorization: Bearer {token}` (untuk endpoint yang dilindungi)
- `Content-Type: application/json`

### Health Check
- `GET /api/ping` - Cek status service

### Autentikasi
- `POST /api/login-mobile` - Login dan dapatkan JWT token

### Tagihan
- `GET /api/tagihan-mobile/{idPersonal}` - Daftar tagihan
- `GET /api/tagihan-mobile/active-payment` - Tagihan aktif
- `GET /api/tagihan-mobile/detail/{id}` - Detail tagihan

### Permohonan
- `GET /api/permohonan-mobile/{idPersonal}` - Daftar permohonan
- `GET /api/permohonan-mobile/detail/{id}` - Detail permohonan
- `POST /api/permohonan-mobile/simpan` - Simpan permohonan baru

### Perjanjian
- `GET /api/perjanjian-mobile/{idPersonal}` - Daftar perjanjian
- `GET /api/perjanjian-mobile/detail/{id}` - Detail perjanjian

### Pembayaran
- `GET /api/pembayaran-mobile/{idPersonal}` - Riwayat pembayaran
- `POST /api/pembayaran-mobile` - Simpan pembayaran
- `GET /api/payment-status/{nomorTagihan}` - Status pembayaran

### Objek Retribusi
- `GET /api/objek-retribusi-mobile/tarif` - Daftar tarif
- `GET /api/objek-retribusi-mobile/detail/{id}` - Detail objek
- `GET /api/objek-retribusi-mobile/detail-tarif/{id}` - Detail tarif

### Combo Data
- `GET /api/combo-jenis-permohonan`
- `GET /api/combo-dokumen-kelengkapan`
- `GET /api/combo-objek-retribusi`
- `GET /api/combo-satuan`
- `GET /api/combo-peruntukan-sewa`
- `GET /api/combo-perioditas`

## Akun Demo

| Username | Password | Role |
|----------|----------|------|
| admin | password123 | Admin |
| budi.santoso | password123 | Penyewa |
| siti.rahayu | password123 | Penyewa |
| eko.purnomo | password123 | Penyewa |
