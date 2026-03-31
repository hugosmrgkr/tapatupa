<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JenisPermohonan extends Model
{
    protected $table = 'jenis_permohonan';
    protected $fillable = ['nama_jenis_permohonan', 'keterangan'];
}
