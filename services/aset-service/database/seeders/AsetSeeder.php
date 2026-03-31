<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AsetSeeder extends Seeder
{
    public function run(): void
    {
        $asets = [
            [
                'kode_aset' => 'AST-001',
                'nama_aset' => 'Kios Pasar Sentral Blok A',
                'lokasi' => 'Jl. Pasar Sentral No. 1, Blok A',
                'deskripsi' => 'Kios pasar strategis di pusat kota, cocok untuk usaha retail dan kuliner',
                'luas' => 12.00,
                'satuan_luas' => 'm2',
                'status' => 'AKTIF',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'kode_aset' => 'AST-002',
                'nama_aset' => 'Gedung Serba Guna Lt. 1',
                'lokasi' => 'Jl. Merdeka No. 10',
                'deskripsi' => 'Gedung serba guna yang dapat digunakan untuk berbagai acara dan kegiatan',
                'luas' => 200.00,
                'satuan_luas' => 'm2',
                'status' => 'AKTIF',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'kode_aset' => 'AST-003',
                'nama_aset' => 'Lapak Pedagang Area Terminal',
                'lokasi' => 'Terminal Kota, Area Pedagang Barat',
                'deskripsi' => 'Lapak pedagang di area terminal, ramai pengunjung setiap hari',
                'luas' => 6.00,
                'satuan_luas' => 'm2',
                'status' => 'AKTIF',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'kode_aset' => 'AST-004',
                'nama_aset' => 'Ruang Kantor Pemerintah Lt. 2',
                'lokasi' => 'Gedung Pemerintah Jl. Proklamasi No. 5, Lt. 2',
                'deskripsi' => 'Ruang kantor yang representatif untuk kegiatan perkantoran profesional',
                'luas' => 50.00,
                'satuan_luas' => 'm2',
                'status' => 'AKTIF',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ];

        $tarifData = [
            'AST-001' => [
                ['nama_tarif' => 'Tarif Dasar Kios', 'satuan' => 'bulan', 'harga_per_satuan' => 500000, 'keterangan' => 'Tarif dasar sewa kios per bulan'],
                ['nama_tarif' => 'Tarif Utilitas', 'satuan' => 'bulan', 'harga_per_satuan' => 100000, 'keterangan' => 'Biaya listrik dan air per bulan'],
            ],
            'AST-002' => [
                ['nama_tarif' => 'Tarif Harian', 'satuan' => 'hari', 'harga_per_satuan' => 2000000, 'keterangan' => 'Tarif sewa gedung per hari'],
                ['nama_tarif' => 'Tarif Bulanan', 'satuan' => 'bulan', 'harga_per_satuan' => 15000000, 'keterangan' => 'Tarif sewa gedung per bulan'],
            ],
            'AST-003' => [
                ['nama_tarif' => 'Tarif Lapak', 'satuan' => 'bulan', 'harga_per_satuan' => 300000, 'keterangan' => 'Tarif sewa lapak per bulan'],
            ],
            'AST-004' => [
                ['nama_tarif' => 'Tarif Kantor', 'satuan' => 'bulan', 'harga_per_satuan' => 3000000, 'keterangan' => 'Tarif sewa ruang kantor per bulan'],
            ],
        ];

        foreach ($asets as $aset) {
            $id = DB::table('aset')->insertGetId($aset);

            foreach ($tarifData[$aset['kode_aset']] as $tarif) {
                DB::table('tarif_aset')->insert([
                    'id_aset' => $id,
                    'nama_tarif' => $tarif['nama_tarif'],
                    'satuan' => $tarif['satuan'],
                    'harga_per_satuan' => $tarif['harga_per_satuan'],
                    'keterangan' => $tarif['keterangan'],
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }
    }
}
