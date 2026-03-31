<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('aset', function (Blueprint $table) {
            $table->id();
            $table->string('kode_aset')->unique();
            $table->string('nama_aset');
            $table->string('lokasi');
            $table->text('deskripsi')->nullable();
            $table->string('foto')->nullable();
            $table->decimal('luas', 10, 2)->nullable();
            $table->string('satuan_luas', 10)->nullable()->default('m2');
            $table->string('status', 20)->default('AKTIF');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('aset');
    }
};
