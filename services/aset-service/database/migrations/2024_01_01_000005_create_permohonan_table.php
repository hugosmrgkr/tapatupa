<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('permohonan', function (Blueprint $table) {
            $table->id();
            $table->string('nomor_permohonan')->unique();
            $table->string('id_personal');
            $table->foreignId('id_aset')->constrained('aset');
            $table->foreignId('id_jenis_permohonan')->constrained('jenis_permohonan');
            $table->foreignId('id_perioditas')->constrained('perioditas');
            $table->foreignId('id_peruntukan_sewa')->constrained('peruntukan_sewa');
            $table->foreignId('id_satuan')->constrained('satuan');
            $table->integer('lama_sewa')->default(1);
            $table->text('catatan')->nullable();
            $table->string('status', 20)->default('PENDING');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('permohonan');
    }
};
