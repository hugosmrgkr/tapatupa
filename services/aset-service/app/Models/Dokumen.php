<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Dokumen extends Model
{
    protected $table = 'dokumen';

    protected $fillable = [
        'id_permohonan', 'id_dokumen_kelengkapan',
        'jenis_dokumen', 'keterangan', 'file_path',
    ];

    public function permohonan()
    {
        return $this->belongsTo(Permohonan::class, 'id_permohonan');
    }

    public function dokumenKelengkapan()
    {
        return $this->belongsTo(DokumenKelengkapan::class, 'id_dokumen_kelengkapan');
    }
}
