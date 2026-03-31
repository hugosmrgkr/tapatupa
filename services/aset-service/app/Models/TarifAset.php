<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TarifAset extends Model
{
    protected $table = 'tarif_aset';

    protected $fillable = [
        'id_aset', 'nama_tarif', 'satuan', 'harga_per_satuan', 'keterangan',
    ];

    protected $casts = ['harga_per_satuan' => 'decimal:2'];

    public function aset()
    {
        return $this->belongsTo(Aset::class, 'id_aset');
    }
}
