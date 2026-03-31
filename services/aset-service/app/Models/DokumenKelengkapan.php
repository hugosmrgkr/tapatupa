<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DokumenKelengkapan extends Model
{
    protected $table = 'dokumen_kelengkapan';
    protected $fillable = ['nama_dokumen', 'keterangan', 'is_required'];
    protected $casts = ['is_required' => 'boolean'];
}
