<?php

namespace App\Http\Controllers;

use App\Models\Pembayaran;
use App\Models\Tagihan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PembayaranController extends Controller
{
    public function index($idPersonal)
    {
        try {
            $pembayaran = Pembayaran::with(['tagihan.perjanjian.aset'])
                ->where('id_personal', $idPersonal)
                ->orderBy('created_at', 'desc')
                ->get()
                ->map(function ($p) {
                    return [
                        'id' => $p->id,
                        'nomorTagihan' => $p->nomor_tagihan,
                        'idTagihan' => $p->id_tagihan,
                        'idPersonal' => $p->id_personal,
                        'nilaiBayar' => $p->nilai_bayar,
                        'metodeBayar' => $p->metode_bayar,
                        'buktiBayar' => $p->bukti_bayar ? asset('storage/' . $p->bukti_bayar) : null,
                        'status' => $p->status,
                        'namaAset' => $p->tagihan?->perjanjian?->aset?->nama_aset,
                        'createdAt' => $p->created_at,
                    ];
                });

            return response()->json([
                'status' => 200,
                'pembayaranSewa' => $pembayaran,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'pembayaranSewa' => [],
                'responseMessage' => $e->getMessage(),
            ], 500);
        }
    }

    public function store(Request $request)
    {
        DB::beginTransaction();
        try {
            $tagihan = Tagihan::where('nomor_tagihan', $request->input('nomorTagihan'))->first();

            if (!$tagihan) {
                return response()->json([
                    'status' => 404,
                    'responseCode' => 404,
                    'responseMessage' => 'Tagihan tidak ditemukan',
                ], 404);
            }

            $buktiBayarPath = null;
            if ($request->hasFile('buktiBayar')) {
                $buktiBayarPath = $request->file('buktiBayar')->store('bukti-bayar', 'public');
            }

            Pembayaran::create([
                'nomor_tagihan' => $request->input('nomorTagihan'),
                'id_tagihan' => $tagihan->id,
                'id_personal' => $request->input('idPersonal'),
                'nilai_bayar' => $request->input('nilaiBayar'),
                'metode_bayar' => $request->input('metodeBayar', 'TRANSFER'),
                'bukti_bayar' => $buktiBayarPath,
                'status' => 'PENDING',
            ]);

            $tagihan->update(['status' => 'PENDING', 'nama_status' => 'Menunggu Konfirmasi']);

            DB::commit();

            return response()->json([
                'status' => 200,
                'responseCode' => 200,
                'responseMessage' => 'Pembayaran berhasil disimpan',
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'status' => 500,
                'responseCode' => 500,
                'responseMessage' => 'Gagal menyimpan pembayaran: ' . $e->getMessage(),
            ], 500);
        }
    }

    public function paymentStatus($nomorTagihan)
    {
        try {
            $tagihan = Tagihan::where('nomor_tagihan', $nomorTagihan)->first();

            if (!$tagihan) {
                return response()->json(['status' => 'UNPAID']);
            }

            $statusMap = [
                'PAID' => 'PAID',
                'SUCCESS' => 'SUCCESS',
                'PENDING' => 'PENDING',
                'UNPAID' => 'UNPAID',
            ];

            $status = $statusMap[$tagihan->status] ?? 'UNPAID';

            return response()->json(['status' => $status]);
        } catch (\Exception $e) {
            return response()->json(['status' => 'UNPAID'], 500);
        }
    }
}
