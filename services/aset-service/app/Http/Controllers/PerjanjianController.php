<?php

namespace App\Http\Controllers;

use App\Models\PerjanjianSewa;
use Illuminate\Http\Request;

class PerjanjianController extends Controller
{
    public function index($idPersonal)
    {
        try {
            $perjanjian = PerjanjianSewa::with(['aset', 'permohonan'])
                ->where('id_personal', $idPersonal)
                ->orderBy('created_at', 'desc')
                ->get()
                ->map(function ($p) {
                    return [
                        'id' => $p->id,
                        'nomorPerjanjian' => $p->nomor_perjanjian,
                        'idPermohonan' => $p->id_permohonan,
                        'idPersonal' => $p->id_personal,
                        'idAset' => $p->id_aset,
                        'namaAset' => $p->aset?->nama_aset,
                        'lokasiAset' => $p->aset?->lokasi,
                        'tanggalMulai' => $p->tanggal_mulai,
                        'tanggalSelesai' => $p->tanggal_selesai,
                        'nilaiSewa' => $p->nilai_sewa,
                        'namaStatus' => $p->nama_status,
                        'status' => $p->status,
                        'createdAt' => $p->created_at,
                    ];
                });

            return response()->json([
                'status' => 200,
                'responseCode' => 200,
                'responseMessage' => 'Data perjanjian berhasil diambil',
                'perjanjianSewa' => $perjanjian,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'responseCode' => 500,
                'responseMessage' => 'Terjadi kesalahan: ' . $e->getMessage(),
                'perjanjianSewa' => [],
            ], 500);
        }
    }

    public function detail($id)
    {
        try {
            $perjanjian = PerjanjianSewa::with(['aset', 'permohonan.jenisPermohonan'])
                ->findOrFail($id);

            $detail = [
                'id' => $perjanjian->id,
                'nomorPerjanjian' => $perjanjian->nomor_perjanjian,
                'idPermohonan' => $perjanjian->id_permohonan,
                'idPersonal' => $perjanjian->id_personal,
                'idAset' => $perjanjian->id_aset,
                'namaAset' => $perjanjian->aset?->nama_aset,
                'lokasiAset' => $perjanjian->aset?->lokasi,
                'deskripsiAset' => $perjanjian->aset?->deskripsi,
                'fotoAset' => $perjanjian->aset?->foto ? asset('storage/' . $perjanjian->aset->foto) : null,
                'tanggalMulai' => $perjanjian->tanggal_mulai,
                'tanggalSelesai' => $perjanjian->tanggal_selesai,
                'nilaiSewa' => $perjanjian->nilai_sewa,
                'namaStatus' => $perjanjian->nama_status,
                'status' => $perjanjian->status,
                'jenisPermohonan' => $perjanjian->permohonan?->jenisPermohonan?->nama_jenis_permohonan,
                'createdAt' => $perjanjian->created_at,
            ];

            return response()->json([
                'status' => 200,
                'perjanjianSewa' => $detail,
            ]);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json([
                'status' => 404,
                'perjanjianSewa' => null,
                'responseMessage' => 'Perjanjian tidak ditemukan',
            ], 404);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'perjanjianSewa' => null,
                'responseMessage' => $e->getMessage(),
            ], 500);
        }
    }
}
