<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tagihan extends Model
{
    protected $table = 'tagihan';

    protected $fillable = [
        'nomor_tagihan', 'id_perjanjian', 'id_personal',
        'periode_bulan', 'periode_tahun', 'nilai_tagihan',
        'denda', 'total_tagihan', 'nama_status', 'status', 'tanggal_jatuh_tempo',
    ];

    protected $casts = [
        'nilai_tagihan' => 'decimal:2',
        'denda' => 'decimal:2',
        'total_tagihan' => 'decimal:2',
        'tanggal_jatuh_tempo' => 'date',
    ];

    public function perjanjian()
    {
        return $this->belongsTo(PerjanjianSewa::class, 'id_perjanjian');
    }

    public function pembayaran()
    {
        return $this->hasMany(Pembayaran::class, 'id_tagihan');
    }
}
