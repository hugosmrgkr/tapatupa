<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PerjanjianSewa extends Model
{
    protected $table = 'perjanjian_sewa';

    protected $fillable = [
        'nomor_perjanjian', 'id_permohonan', 'id_personal',
        'id_aset', 'tanggal_mulai', 'tanggal_selesai',
        'nilai_sewa', 'nama_status', 'status',
    ];

    protected $casts = [
        'tanggal_mulai' => 'date',
        'tanggal_selesai' => 'date',
        'nilai_sewa' => 'decimal:2',
    ];

    public function aset()
    {
        return $this->belongsTo(Aset::class, 'id_aset');
    }

    public function permohonan()
    {
        return $this->belongsTo(Permohonan::class, 'id_permohonan');
    }

    public function tagihan()
    {
        return $this->hasMany(Tagihan::class, 'id_perjanjian');
    }
}
