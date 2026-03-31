<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('pembayaran', function (Blueprint $table) {
            $table->id();
            $table->string('nomor_tagihan');
            $table->foreignId('id_tagihan')->constrained('tagihan');
            $table->bigInteger('id_personal');
            $table->decimal('nilai_bayar', 15, 2);
            $table->string('metode_bayar', 50)->default('TRANSFER');
            $table->string('bukti_bayar')->nullable();
            $table->string('status', 20)->default('PENDING');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('pembayaran');
    }
};
