<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Permohonan extends Model
{
    protected $table = 'permohonan';

    protected $fillable = [
        'nomor_permohonan', 'id_personal', 'id_aset',
        'id_jenis_permohonan', 'id_perioditas', 'id_peruntukan_sewa',
        'id_satuan', 'lama_sewa', 'catatan', 'status',
    ];

    public function aset()
    {
        return $this->belongsTo(Aset::class, 'id_aset');
    }

    public function jenisPermohonan()
    {
        return $this->belongsTo(JenisPermohonan::class, 'id_jenis_permohonan');
    }

    public function perioditas()
    {
        return $this->belongsTo(Perioditas::class, 'id_perioditas');
    }

    public function peruntukanSewa()
    {
        return $this->belongsTo(PeruntukanSewa::class, 'id_peruntukan_sewa');
    }

    public function satuan()
    {
        return $this->belongsTo(Satuan::class, 'id_satuan');
    }

    public function dokumen()
    {
        return $this->hasMany(Dokumen::class, 'id_permohonan');
    }
}
