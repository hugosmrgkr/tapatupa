<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pembayaran extends Model
{
    protected $table = 'pembayaran';

    protected $fillable = [
        'nomor_tagihan', 'id_tagihan', 'id_personal',
        'nilai_bayar', 'metode_bayar', 'bukti_bayar', 'status',
    ];

    protected $casts = ['nilai_bayar' => 'decimal:2'];

    public function tagihan()
    {
        return $this->belongsTo(Tagihan::class, 'id_tagihan');
    }
}
