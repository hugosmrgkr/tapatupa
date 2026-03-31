<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PerjanjianTagihanSeeder extends Seeder
{
    public function run(): void
    {
        $aset1 = DB::table('aset')->where('kode_aset', 'AST-001')->first();
        $aset2 = DB::table('aset')->where('kode_aset', 'AST-002')->first();

        $perjanjian1Id = DB::table('perjanjian_sewa')->insertGetId([
            'nomor_perjanjian' => 'PRJ-2024-0001',
            'id_permohonan' => null,
            'id_personal' => 1001,
            'id_aset' => $aset1->id,
            'tanggal_mulai' => '2024-01-01',
            'tanggal_selesai' => '2024-12-31',
            'nilai_sewa' => 600000,
            'nama_status' => 'Aktif',
            'status' => 'AKTIF',
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $perjanjian2Id = DB::table('perjanjian_sewa')->insertGetId([
            'nomor_perjanjian' => 'PRJ-2024-0002',
            'id_permohonan' => null,
            'id_personal' => 1002,
            'id_aset' => $aset2->id,
            'tanggal_mulai' => '2024-03-01',
            'tanggal_selesai' => '2025-02-28',
            'nilai_sewa' => 15000000,
            'nama_status' => 'Aktif',
            'status' => 'AKTIF',
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        // Create tagihan for perjanjian1
        $bulanData = [
            ['bulan' => 1, 'status' => 'PAID', 'nama_status' => 'Sudah Bayar'],
            ['bulan' => 2, 'status' => 'PAID', 'nama_status' => 'Sudah Bayar'],
            ['bulan' => 3, 'status' => 'PAID', 'nama_status' => 'Sudah Bayar'],
            ['bulan' => 4, 'status' => 'UNPAID', 'nama_status' => 'Belum Bayar'],
            ['bulan' => 5, 'status' => 'UNPAID', 'nama_status' => 'Belum Bayar'],
        ];

        foreach ($bulanData as $data) {
            $jatuhTempo = Carbon::create(2024, $data['bulan'], 1)->endOfMonth();
            DB::table('tagihan')->insert([
                'nomor_tagihan' => 'TGH-2024-' . str_pad($perjanjian1Id, 3, '0', STR_PAD_LEFT) . '-' . str_pad($data['bulan'], 2, '0', STR_PAD_LEFT),
                'id_perjanjian' => $perjanjian1Id,
                'id_personal' => 1001,
                'periode_bulan' => $data['bulan'],
                'periode_tahun' => 2024,
                'nilai_tagihan' => 600000,
                'denda' => 0,
                'total_tagihan' => 600000,
                'nama_status' => $data['nama_status'],
                'status' => $data['status'],
                'tanggal_jatuh_tempo' => $jatuhTempo,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        // Create tagihan for perjanjian2
        $bulanData2 = [
            ['bulan' => 3, 'status' => 'PAID', 'nama_status' => 'Sudah Bayar'],
            ['bulan' => 4, 'status' => 'UNPAID', 'nama_status' => 'Belum Bayar'],
        ];

        foreach ($bulanData2 as $data) {
            $jatuhTempo = Carbon::create(2024, $data['bulan'], 1)->endOfMonth();
            DB::table('tagihan')->insert([
                'nomor_tagihan' => 'TGH-2024-' . str_pad($perjanjian2Id, 3, '0', STR_PAD_LEFT) . '-' . str_pad($data['bulan'], 2, '0', STR_PAD_LEFT),
                'id_perjanjian' => $perjanjian2Id,
                'id_personal' => 1002,
                'periode_bulan' => $data['bulan'],
                'periode_tahun' => 2024,
                'nilai_tagihan' => 15000000,
                'denda' => 0,
                'total_tagihan' => 15000000,
                'nama_status' => $data['nama_status'],
                'status' => $data['status'],
                'tanggal_jatuh_tempo' => $jatuhTempo,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        // Add pembayaran records for PAID tagihan
        $paidTagihan = DB::table('tagihan')->where('status', 'PAID')->get();
        foreach ($paidTagihan as $tgh) {
            DB::table('pembayaran')->insert([
                'nomor_tagihan' => $tgh->nomor_tagihan,
                'id_tagihan' => $tgh->id,
                'id_personal' => $tgh->id_personal,
                'nilai_bayar' => $tgh->total_tagihan,
                'metode_bayar' => 'TRANSFER',
                'bukti_bayar' => null,
                'status' => 'SUCCESS',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
