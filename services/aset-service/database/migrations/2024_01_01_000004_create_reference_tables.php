<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('jenis_permohonan', function (Blueprint $table) {
            $table->id();
            $table->string('nama_jenis_permohonan');
            $table->text('keterangan')->nullable();
            $table->timestamps();
        });

        Schema::create('perioditas', function (Blueprint $table) {
            $table->id();
            $table->string('nama_perioditas');
            $table->integer('jumlah_bulan');
            $table->text('keterangan')->nullable();
            $table->timestamps();
        });

        Schema::create('peruntukan_sewa', function (Blueprint $table) {
            $table->id();
            $table->string('nama_peruntukan');
            $table->text('keterangan')->nullable();
            $table->timestamps();
        });

        Schema::create('satuan', function (Blueprint $table) {
            $table->id();
            $table->string('nama_satuan');
            $table->text('keterangan')->nullable();
            $table->timestamps();
        });

        Schema::create('dokumen_kelengkapan', function (Blueprint $table) {
            $table->id();
            $table->string('nama_dokumen');
            $table->text('keterangan')->nullable();
            $table->boolean('is_required')->default(false);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('dokumen_kelengkapan');
        Schema::dropIfExists('satuan');
        Schema::dropIfExists('peruntukan_sewa');
        Schema::dropIfExists('perioditas');
        Schema::dropIfExists('jenis_permohonan');
    }
};
