<?php

namespace App\Http\Controllers;

use App\Models\Aset;
use App\Models\TarifAset;
use Illuminate\Http\Request;

class ObjekRetribusiController extends Controller
{
    public function tarif()
    {
        try {
            $tarif = Aset::with('tarif')
                ->where('status', 'AKTIF')
                ->get()
                ->map(function ($a) {
                    return [
                        'id' => $a->id,
                        'kodeAset' => $a->kode_aset,
                        'namaAset' => $a->nama_aset,
                        'lokasi' => $a->lokasi,
                        'deskripsi' => $a->deskripsi,
                        'foto' => $a->foto ? asset('storage/' . $a->foto) : null,
                        'luas' => $a->luas,
                        'satuanLuas' => $a->satuan_luas,
                        'status' => $a->status,
                        'tarif' => $a->tarif->map(function ($t) {
                            return [
                                'id' => $t->id,
                                'namaTarif' => $t->nama_tarif,
                                'satuan' => $t->satuan,
                                'hargaPerSatuan' => $t->harga_per_satuan,
                                'keterangan' => $t->keterangan,
                            ];
                        }),
                    ];
                });

            return response()->json([
                'status' => 200,
                'tarifRetribusi' => $tarif,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'tarifRetribusi' => [],
                'responseMessage' => $e->getMessage(),
            ], 500);
        }
    }

    public function detail($id)
    {
        try {
            $aset = Aset::with('tarif')->findOrFail($id);

            return response()->json([
                'status' => 200,
                'objekRetribusi' => [
                    'id' => $aset->id,
                    'kodeAset' => $aset->kode_aset,
                    'namaAset' => $aset->nama_aset,
                    'lokasi' => $aset->lokasi,
                    'deskripsi' => $aset->deskripsi,
                    'foto' => $aset->foto ? asset('storage/' . $aset->foto) : null,
                    'luas' => $aset->luas,
                    'satuanLuas' => $aset->satuan_luas,
                    'status' => $aset->status,
                    'tarif' => $aset->tarif->map(function ($t) {
                        return [
                            'id' => $t->id,
                            'namaTarif' => $t->nama_tarif,
                            'satuan' => $t->satuan,
                            'hargaPerSatuan' => $t->harga_per_satuan,
                            'keterangan' => $t->keterangan,
                        ];
                    }),
                ],
            ]);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json([
                'status' => 404,
                'objekRetribusi' => null,
                'responseMessage' => 'Objek retribusi tidak ditemukan',
            ], 404);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'objekRetribusi' => null,
                'responseMessage' => $e->getMessage(),
            ], 500);
        }
    }

    public function detailTarif($id)
    {
        try {
            $tarif = TarifAset::with('aset')->findOrFail($id);

            return response()->json([
                'status' => 200,
                'tarifObjekRetribusi' => [
                    'id' => $tarif->id,
                    'idAset' => $tarif->id_aset,
                    'namaAset' => $tarif->aset?->nama_aset,
                    'namaTarif' => $tarif->nama_tarif,
                    'satuan' => $tarif->satuan,
                    'hargaPerSatuan' => $tarif->harga_per_satuan,
                    'keterangan' => $tarif->keterangan,
                ],
            ]);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json([
                'status' => 404,
                'tarifObjekRetribusi' => null,
                'responseMessage' => 'Tarif tidak ditemukan',
            ], 404);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'tarifObjekRetribusi' => null,
                'responseMessage' => $e->getMessage(),
            ], 500);
        }
    }
}
