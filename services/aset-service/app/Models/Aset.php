<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Aset extends Model
{
    protected $table = 'aset';

    protected $fillable = [
        'kode_aset', 'nama_aset', 'lokasi', 'deskripsi',
        'foto', 'luas', 'satuan_luas', 'status',
    ];

    public function tarif()
    {
        return $this->hasMany(TarifAset::class, 'id_aset');
    }

    public function perjanjian()
    {
        return $this->hasMany(PerjanjianSewa::class, 'id_aset');
    }
}
