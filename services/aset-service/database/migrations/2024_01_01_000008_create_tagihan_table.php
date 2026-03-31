<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tagihan', function (Blueprint $table) {
            $table->id();
            $table->string('nomor_tagihan')->unique();
            $table->foreignId('id_perjanjian')->constrained('perjanjian_sewa');
            $table->string('id_personal');
            $table->integer('periode_bulan');
            $table->integer('periode_tahun');
            $table->decimal('nilai_tagihan', 15, 2);
            $table->decimal('denda', 15, 2)->default(0);
            $table->decimal('total_tagihan', 15, 2);
            $table->string('nama_status')->default('Belum Bayar');
            $table->string('status', 20)->default('UNPAID');
            $table->date('tanggal_jatuh_tempo');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tagihan');
    }
};
