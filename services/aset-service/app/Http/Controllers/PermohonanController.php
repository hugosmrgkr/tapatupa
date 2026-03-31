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

            $detail = [
                'id' => $permohonan->id,
                'nomorPermohonan' => $permohonan->nomor_permohonan,
                'idPersonal' => $permohonan->id_personal,
                'idAset' => $permohonan->id_aset,
                'namaAset' => $permohonan->aset?->nama_aset,
                'lokasiAset' => $permohonan->aset?->lokasi,
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

            return response()->json([
                'status' => 200,
                'detailPermohonan' => $detail,
            ]);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json([
                'status' => 404,
                'detailPermohonan' => null,
                'responseMessage' => 'Permohonan tidak ditemukan',
            ], 404);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'detailPermohonan' => null,
                'responseMessage' => $e->getMessage(),
            ], 500);
        }
    }

    public function simpan(Request $request)
    {
        DB::beginTransaction();
        try {
            $nomorPermohonan = 'PRM-' . date('Ymd') . '-' . strtoupper(Str::random(6));

            $permohonan = Permohonan::create([
                'nomor_permohonan' => $nomorPermohonan,
                'id_personal' => $request->input('idPersonal'),
                'id_aset' => $request->input('idAset'),
                'id_jenis_permohonan' => $request->input('idJenisPermohonan'),
                'id_perioditas' => $request->input('idPerioditas'),
                'id_peruntukan_sewa' => $request->input('idPeruntukanSewa'),
                'id_satuan' => $request->input('idSatuan'),
                'lama_sewa' => $request->input('lamaSewa'),
                'catatan' => $request->input('catatan'),
                'status' => 'PENDING',
            ]);

            // Handle file uploads
            if ($request->hasFile('files')) {
                foreach ($request->file('files') as $index => $file) {
                    $path = $file->store('dokumen/' . $permohonan->id, 'public');
                    Dokumen::create([
                        'id_permohonan' => $permohonan->id,
                        'id_dokumen_kelengkapan' => $request->input('idDokumen.' . $index),
                        'jenis_dokumen' => $request->input('jenisDokumen.' . $index, $file->getClientOriginalName()),
                        'keterangan' => $request->input('keteranganDokumen.' . $index),
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
