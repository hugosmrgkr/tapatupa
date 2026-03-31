<?php

namespace App\Http\Controllers;

use App\Models\Dokumen;
use App\Models\Permohonan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class PermohonanController extends Controller
{
    public function index($idPersonal)
    {
        try {
            $permohonan = Permohonan::with(['aset', 'jenisPermohonan', 'perioditas'])
                ->where('id_personal', $idPersonal)
                ->orderBy('created_at', 'desc')
                ->get()
                ->map(function ($p) {
                    return [
                        'id' => $p->id,
                        'nomorPermohonan' => $p->nomor_permohonan,
                        'idPersonal' => $p->id_personal,
                        'idAset' => $p->id_aset,
                        'namaAset' => $p->aset?->nama_aset,
                        'jenisPermohonan' => $p->jenisPermohonan?->nama_jenis_permohonan,
                        'perioditas' => $p->perioditas?->nama_perioditas,
                        'lamaSewa' => $p->lama_sewa,
                        'catatan' => $p->catatan,
                        'status' => $p->status,
                        'createdAt' => $p->created_at,
                    ];
                });

            return response()->json([
                'status' => 200,
                'responseCode' => 200,
                'responseMessage' => 'Data permohonan berhasil diambil',
                'permohonanSewa' => $permohonan,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'responseCode' => 500,
                'responseMessage' => 'Terjadi kesalahan: ' . $e->getMessage(),
                'permohonanSewa' => [],
            ], 500);
        }
    }

    public function detail($id)
    {
        try {
            $permohonan = Permohonan::with([
                'aset', 'jenisPermohonan', 'perioditas', 'peruntukanSewa', 'satuan', 'dokumen.dokumenKelengkapan'
            ])->findOrFail($id);

            return response()->json([
                'status' => 200,
                'detailDermohonan' => $this->formatDetail($permohonan),
            ]);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json([
                'status' => 404,
                'detailDermohonan' => null,
                'responseMessage' => 'Permohonan tidak ditemukan',
            ], 404);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'detailDermohonan' => null,
                'responseMessage' => $e->getMessage(),
            ], 500);
        }
    }

    public function detailByKode($kodeObjekRetribusi)
    {
        try {
            $permohonan = Permohonan::with([
                'aset', 'jenisPermohonan', 'perioditas', 'peruntukanSewa', 'satuan', 'dokumen.dokumenKelengkapan'
            ])->whereHas('aset', function ($q) use ($kodeObjekRetribusi) {
                $q->where('kode_aset', $kodeObjekRetribusi);
            })->latest()->firstOrFail();

            $detail = $this->formatDetail($permohonan);

            return response()->json([
                'status' => 200,
                'detailDermohonan' => $detail,
            ]);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json([
                'status' => 404,
                'detailDermohonan' => null,
                'responseMessage' => 'Permohonan tidak ditemukan',
            ], 404);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'detailDermohonan' => null,
                'responseMessage' => $e->getMessage(),
            ], 500);
        }
    }

    private function formatDetail(Permohonan $permohonan): array
    {
        return [
            'id' => $permohonan->id,
            'nomorPermohonan' => $permohonan->nomor_permohonan,
            'idPersonal' => $permohonan->id_personal,
            'idAset' => $permohonan->id_aset,
            'namaAset' => $permohonan->aset?->nama_aset,
            'lokasiAset' => $permohonan->aset?->lokasi,
            'kodeObjekRetribusi' => $permohonan->aset?->kode_aset,
            'jenisPermohonan' => $permohonan->jenisPermohonan?->nama_jenis_permohonan,
            'idJenisPermohonan' => $permohonan->id_jenis_permohonan,
            'perioditas' => $permohonan->perioditas?->nama_perioditas,
            'idPerioditas' => $permohonan->id_perioditas,
            'peruntukanSewa' => $permohonan->peruntukanSewa?->nama_peruntukan,
            'idPeruntukanSewa' => $permohonan->id_peruntukan_sewa,
            'satuan' => $permohonan->satuan?->nama_satuan,
            'idSatuan' => $permohonan->id_satuan,
            'lamaSewa' => $permohonan->lama_sewa,
            'catatan' => $permohonan->catatan,
            'status' => $permohonan->status,
            'createdAt' => $permohonan->created_at,
            'dokumen' => $permohonan->dokumen->map(function ($d) {
                return [
                    'id' => $d->id,
                    'jenisDokumen' => $d->jenis_dokumen,
                    'keterangan' => $d->keterangan,
                    'filePath' => $d->file_path ? asset('storage/' . $d->file_path) : null,
                    'namaDokumen' => $d->dokumenKelengkapan?->nama_dokumen,
                ];
            }),
        ];
    }

    public function simpan(Request $request)
    {
        DB::beginTransaction();
        try {
            // Support both field name conventions from buat-permohonan.dart and buat-permohonan-baru.dart
            $idPersonal = $request->input('idWajibRetribusi')
                ?? $request->input('wajibRetribusi')
                ?? $request->input('idPersonal');

            $idAset = $request->input('idObjekRetribusi')
                ?? $request->input('objekRetribusi')
                ?? $request->input('idAset');

            $idJenisPermohonan = $request->input('idJenisPermohonan')
                ?? $request->input('jenisPermohonan');

            $idPerioditas = $request->input('idPerioditas')
                ?? $request->input('perioditas');

            $idPeruntukanSewa = $request->input('idPeruntukanSewa')
                ?? $request->input('peruntukanSewa');

            $idSatuan = $request->input('idSatuan')
                ?? $request->input('satuan');

            $nomorPermohonan = $request->input('nomorPermohonan')
                ?? ('PRM-' . date('Ymd') . '-' . strtoupper(Str::random(6)));

            $permohonan = Permohonan::create([
                'nomor_permohonan' => $nomorPermohonan,
                'id_personal' => $idPersonal,
                'id_aset' => $idAset,
                'id_jenis_permohonan' => $idJenisPermohonan,
                'id_perioditas' => $idPerioditas,
                'id_peruntukan_sewa' => $idPeruntukanSewa,
                'id_satuan' => $idSatuan,
                'lama_sewa' => $request->input('lamaSewa'),
                'catatan' => $request->input('catatan'),
                'status' => 'PENDING',
            ]);

            // Handle file uploads - files come as fileDokumen[0], fileDokumen[1], etc.
            $files = $request->file('fileDokumen') ?? [];
            foreach ($files as $index => $file) {
                if ($file && $file->isValid()) {
                    $path = $file->store('dokumen/' . $permohonan->id, 'public');
                    Dokumen::create([
                        'id_permohonan' => $permohonan->id,
                        'id_dokumen_kelengkapan' => $request->input('idDokumenKelengkapan.' . $index),
                        'jenis_dokumen' => $request->input('jenisDokumen.' . $index, $file->getClientOriginalName()),
                        'keterangan' => $request->input('keteranganDokumen.' . $index, ''),
                        'file_path' => $path,
                    ]);
                }
            }

            DB::commit();

            return response()->json([
                'status' => 200,
                'responseCode' => 200,
                'responseMessage' => 'Permohonan berhasil disimpan',
                'nomorPermohonan' => $nomorPermohonan,
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'status' => 500,
                'responseCode' => 500,
                'responseMessage' => 'Gagal menyimpan permohonan: ' . $e->getMessage(),
            ], 500);
        }
    }
}
