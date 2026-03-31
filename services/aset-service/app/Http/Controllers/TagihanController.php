<?php

namespace App\Http\Controllers;

use App\Models\Tagihan;
use Illuminate\Http\Request;

class TagihanController extends Controller
{
    public function index($idPersonal)
    {
        try {
            $tagihan = Tagihan::with(['perjanjian.aset'])
                ->where('id_personal', $idPersonal)
                ->orderBy('created_at', 'desc')
                ->get()
                ->map(function ($t) {
                    return [
                        'id' => $t->id,
                        'nomorTagihan' => $t->nomor_tagihan,
                        'idPerjanjian' => $t->id_perjanjian,
                        'idPersonal' => $t->id_personal,
                        'periodeBulan' => $t->periode_bulan,
                        'periodeTahun' => $t->periode_tahun,
                        'nilaiTagihan' => $t->nilai_tagihan,
                        'denda' => $t->denda,
                        'totalTagihan' => $t->total_tagihan,
                        'namaStatus' => $t->nama_status,
                        'status' => $t->status,
                        'tanggalJatuhTempo' => $t->tanggal_jatuh_tempo,
                        'namaAset' => $t->perjanjian?->aset?->nama_aset,
                        'createdAt' => $t->created_at,
                    ];
                });

            return response()->json([
                'status' => 200,
                'responseCode' => 200,
                'responseMessage' => 'Data tagihan berhasil diambil',
                'tagihanSewa' => $tagihan,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'responseCode' => 500,
                'responseMessage' => 'Terjadi kesalahan: ' . $e->getMessage(),
                'tagihanSewa' => [],
            ], 500);
        }
    }

    public function activePayment(Request $request)
    {
        try {
            $tagihan = Tagihan::whereIn('status', ['UNPAID', 'PENDING'])
                ->orderBy('tanggal_jatuh_tempo', 'asc')
                ->first();

            if (!$tagihan) {
                return response()->json([
                    'status' => 200,
                    'data' => null,
                ]);
            }

            return response()->json([
                'status' => 200,
                'data' => [
                    'id' => $tagihan->id,
                    'nomorTagihan' => $tagihan->nomor_tagihan,
                    'idPerjanjian' => $tagihan->id_perjanjian,
                    'idPersonal' => $tagihan->id_personal,
                    'periodeBulan' => $tagihan->periode_bulan,
                    'periodeTahun' => $tagihan->periode_tahun,
                    'nilaiTagihan' => $tagihan->nilai_tagihan,
                    'denda' => $tagihan->denda,
                    'totalTagihan' => $tagihan->total_tagihan,
                    'namaStatus' => $tagihan->nama_status,
                    'status' => $tagihan->status,
                    'tanggalJatuhTempo' => $tagihan->tanggal_jatuh_tempo,
                ],
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'data' => null,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function detail($id)
    {
        try {
            $tagihan = Tagihan::with(['perjanjian.aset', 'pembayaran'])
                ->findOrFail($id);

            $headDetail = [
                'id' => $tagihan->id,
                'nomorTagihan' => $tagihan->nomor_tagihan,
                'idPerjanjian' => $tagihan->id_perjanjian,
                'idPersonal' => $tagihan->id_personal,
                'periodeBulan' => $tagihan->periode_bulan,
                'periodeTahun' => $tagihan->periode_tahun,
                'nilaiTagihan' => $tagihan->nilai_tagihan,
                'denda' => $tagihan->denda,
                'totalTagihan' => $tagihan->total_tagihan,
                'namaStatus' => $tagihan->nama_status,
                'status' => $tagihan->status,
                'tanggalJatuhTempo' => $tagihan->tanggal_jatuh_tempo,
                'namaAset' => $tagihan->perjanjian?->aset?->nama_aset,
                'lokasiAset' => $tagihan->perjanjian?->aset?->lokasi,
            ];

            $tagihanDetail = $tagihan->pembayaran->map(function ($p) {
                return [
                    'id' => $p->id,
                    'nomorTagihan' => $p->nomor_tagihan,
                    'idTagihan' => $p->id_tagihan,
                    'idPersonal' => $p->id_personal,
                    'nilaiBayar' => $p->nilai_bayar,
                    'metodeBayar' => $p->metode_bayar,
                    'buktiBayar' => $p->bukti_bayar ? asset('storage/' . $p->bukti_bayar) : null,
                    'status' => $p->status,
                    'createdAt' => $p->created_at,
                ];
            });

            return response()->json([
                'status' => 200,
                'headTagihanDetail' => $headDetail,
                'tagihanDetail' => $tagihanDetail,
            ]);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json([
                'status' => 404,
                'headTagihanDetail' => null,
                'tagihanDetail' => [],
                'responseMessage' => 'Tagihan tidak ditemukan',
            ], 404);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'headTagihanDetail' => null,
                'tagihanDetail' => [],
                'responseMessage' => $e->getMessage(),
            ], 500);
        }
    }
}
