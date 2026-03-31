<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tarif_aset', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_aset')->constrained('aset')->onDelete('cascade');
            $table->string('nama_tarif');
            $table->string('satuan');
            $table->decimal('harga_per_satuan', 15, 2);
            $table->text('keterangan')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tarif_aset');
    }
};
