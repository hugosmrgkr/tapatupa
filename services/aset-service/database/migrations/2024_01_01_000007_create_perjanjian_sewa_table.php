<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('perjanjian_sewa', function (Blueprint $table) {
            $table->id();
            $table->string('nomor_perjanjian')->unique();
            $table->foreignId('id_permohonan')->nullable()->constrained('permohonan');
            $table->string('id_personal');
            $table->foreignId('id_aset')->constrained('aset');
            $table->date('tanggal_mulai');
            $table->date('tanggal_selesai');
            $table->decimal('nilai_sewa', 15, 2);
            $table->string('nama_status')->default('Aktif');
            $table->string('status', 20)->default('AKTIF');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('perjanjian_sewa');
    }
};
