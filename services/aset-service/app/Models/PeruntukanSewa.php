<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PeruntukanSewa extends Model
{
    protected $table = 'peruntukan_sewa';
    protected $fillable = ['nama_peruntukan', 'keterangan'];
}
