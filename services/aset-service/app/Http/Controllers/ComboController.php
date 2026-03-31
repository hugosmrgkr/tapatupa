<?php

namespace App\Http\Controllers;

use App\Models\Aset;
use App\Models\DokumenKelengkapan;
use App\Models\JenisPermohonan;
use App\Models\Perioditas;
use App\Models\PeruntukanSewa;
use App\Models\Satuan;

class ComboController extends Controller
{
    public function jenisPermohonan()
    {
        try {
            $data = JenisPermohonan::all()->map(fn($item) => [
                'id' => $item->id,
                'namaJenisPermohonan' => $item->nama_jenis_permohonan,
                'keterangan' => $item->keterangan,
            ]);
            return response()->json(['status' => 200, 'jenisPermohonan' => $data]);
        } catch (\Exception $e) {
            return response()->json(['status' => 500, 'jenisPermohonan' => [], 'message' => $e->getMessage()], 500);
        }
    }

    public function dokumenKelengkapan()
    {
        try {
            $data = DokumenKelengkapan::all()->map(fn($item) => [
                'id' => $item->id,
                'namaDokumen' => $item->nama_dokumen,
                'keterangan' => $item->keterangan,
                'isRequired' => $item->is_required,
            ]);
            return response()->json(['status' => 200, 'dokumen' => $data]);
        } catch (\Exception $e) {
            return response()->json(['status' => 500, 'dokumen' => [], 'message' => $e->getMessage()], 500);
        }
    }

    public function objekRetribusi()
    {
        try {
            $data = Aset::where('status', 'AKTIF')->get()->map(fn($item) => [
                'id' => $item->id,
                'kodeAset' => $item->kode_aset,
                'namaAset' => $item->nama_aset,
                'lokasi' => $item->lokasi,
            ]);
            return response()->json(['status' => 200, 'objekRetribusi' => $data]);
        } catch (\Exception $e) {
            return response()->json(['status' => 500, 'objekRetribusi' => [], 'message' => $e->getMessage()], 500);
        }
    }

    public function satuan()
    {
        try {
            $data = Satuan::all()->map(fn($item) => [
                'id' => $item->id,
                'namaSatuan' => $item->nama_satuan,
                'keterangan' => $item->keterangan,
            ]);
            return response()->json(['status' => 200, 'satuan' => $data]);
        } catch (\Exception $e) {
            return response()->json(['status' => 500, 'satuan' => [], 'message' => $e->getMessage()], 500);
        }
    }

    public function peruntukanSewa()
    {
        try {
            $data = PeruntukanSewa::all()->map(fn($item) => [
                'id' => $item->id,
                'namaPeruntukan' => $item->nama_peruntukan,
                'keterangan' => $item->keterangan,
            ]);
            return response()->json(['status' => 200, 'peruntukanSewa' => $data]);
        } catch (\Exception $e) {
            return response()->json(['status' => 500, 'peruntukanSewa' => [], 'message' => $e->getMessage()], 500);
        }
    }

    public function perioditas()
    {
        try {
            $data = Perioditas::all()->map(fn($item) => [
                'id' => $item->id,
                'namaPerioditas' => $item->nama_perioditas,
                'jumlahBulan' => $item->jumlah_bulan,
                'keterangan' => $item->keterangan,
            ]);
            return response()->json(['status' => 200, 'jangkaWaktu' => $data]);
        } catch (\Exception $e) {
            return response()->json(['status' => 500, 'jangkaWaktu' => [], 'message' => $e->getMessage()], 500);
        }
    }
}
