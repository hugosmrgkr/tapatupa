<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ReferenceSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('jenis_permohonan')->insert([
            ['nama_jenis_permohonan' => 'Sewa Baru', 'keterangan' => 'Permohonan sewa aset baru', 'created_at' => now(), 'updated_at' => now()],
            ['nama_jenis_permohonan' => 'Perpanjangan Sewa', 'keterangan' => 'Perpanjangan masa sewa aset', 'created_at' => now(), 'updated_at' => now()],
            ['nama_jenis_permohonan' => 'Perubahan Data', 'keterangan' => 'Perubahan data perjanjian sewa', 'created_at' => now(), 'updated_at' => now()],
        ]);

        DB::table('perioditas')->insert([
            ['nama_perioditas' => 'Bulanan', 'jumlah_bulan' => 1, 'keterangan' => 'Sewa per bulan', 'created_at' => now(), 'updated_at' => now()],
            ['nama_perioditas' => 'Triwulanan', 'jumlah_bulan' => 3, 'keterangan' => 'Sewa per 3 bulan', 'created_at' => now(), 'updated_at' => now()],
            ['nama_perioditas' => 'Semesteran', 'jumlah_bulan' => 6, 'keterangan' => 'Sewa per 6 bulan', 'created_at' => now(), 'updated_at' => now()],
            ['nama_perioditas' => 'Tahunan', 'jumlah_bulan' => 12, 'keterangan' => 'Sewa per tahun', 'created_at' => now(), 'updated_at' => now()],
        ]);

        DB::table('peruntukan_sewa')->insert([
            ['nama_peruntukan' => 'Usaha', 'keterangan' => 'Untuk kegiatan usaha/bisnis', 'created_at' => now(), 'updated_at' => now()],
            ['nama_peruntukan' => 'Sosial', 'keterangan' => 'Untuk kegiatan sosial', 'created_at' => now(), 'updated_at' => now()],
            ['nama_peruntukan' => 'Pendidikan', 'keterangan' => 'Untuk kegiatan pendidikan', 'created_at' => now(), 'updated_at' => now()],
            ['nama_peruntukan' => 'Perkantoran', 'keterangan' => 'Untuk kegiatan perkantoran', 'created_at' => now(), 'updated_at' => now()],
        ]);

        DB::table('satuan')->insert([
            ['nama_satuan' => 'm2', 'keterangan' => 'Meter persegi', 'created_at' => now(), 'updated_at' => now()],
            ['nama_satuan' => 'm3', 'keterangan' => 'Meter kubik', 'created_at' => now(), 'updated_at' => now()],
            ['nama_satuan' => 'unit', 'keterangan' => 'Per unit', 'created_at' => now(), 'updated_at' => now()],
            ['nama_satuan' => 'lot', 'keterangan' => 'Per lot', 'created_at' => now(), 'updated_at' => now()],
        ]);

        DB::table('dokumen_kelengkapan')->insert([
            ['nama_dokumen' => 'KTP', 'keterangan' => 'Kartu Tanda Penduduk', 'is_required' => true, 'created_at' => now(), 'updated_at' => now()],
            ['nama_dokumen' => 'NPWP', 'keterangan' => 'Nomor Pokok Wajib Pajak', 'is_required' => false, 'created_at' => now(), 'updated_at' => now()],
            ['nama_dokumen' => 'SIUP', 'keterangan' => 'Surat Izin Usaha Perdagangan', 'is_required' => false, 'created_at' => now(), 'updated_at' => now()],
            ['nama_dokumen' => 'Akta Pendirian', 'keterangan' => 'Akta pendirian perusahaan', 'is_required' => false, 'created_at' => now(), 'updated_at' => now()],
            ['nama_dokumen' => 'Surat Permohonan', 'keterangan' => 'Surat permohonan sewa', 'is_required' => true, 'created_at' => now(), 'updated_at' => now()],
        ]);
    }
}
