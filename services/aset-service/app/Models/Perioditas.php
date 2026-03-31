<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Perioditas extends Model
{
    protected $table = 'perioditas';
    protected $fillable = ['nama_perioditas', 'jumlah_bulan', 'keterangan'];
}
