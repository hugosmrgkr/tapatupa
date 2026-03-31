<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('dokumen', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_permohonan')->constrained('permohonan')->onDelete('cascade');
            $table->foreignId('id_dokumen_kelengkapan')->nullable()->constrained('dokumen_kelengkapan');
            $table->string('jenis_dokumen')->nullable();
            $table->text('keterangan')->nullable();
            $table->string('file_path');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('dokumen');
    }
};
