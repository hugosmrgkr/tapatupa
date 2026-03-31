<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\ComboController;
use App\Http\Controllers\ObjekRetribusiController;
use App\Http\Controllers\PembayaranController;
use App\Http\Controllers\PerjanjianController;
use App\Http\Controllers\PermohonanController;
use App\Http\Controllers\TagihanController;
use Illuminate\Support\Facades\Route;

// Health check
Route::get('/ping', function () {
    return response()->json(['status' => 200, 'message' => 'OK']);
});

// All routes require Vendor-ID header
Route::middleware('vendor.id')->group(function () {

    // Authentication
    Route::post('/login-mobile', [AuthController::class, 'loginMobile']);

    // Protected routes require JWT auth
    Route::middleware('auth.jwt')->group(function () {

        // Tagihan (Billing)
        Route::prefix('tagihan-mobile')->group(function () {
            Route::get('/active-payment', [TagihanController::class, 'activePayment']);
            Route::get('/detail/{id}', [TagihanController::class, 'detail']);
            Route::get('/{idPersonal}', [TagihanController::class, 'index']);
        });

        // Permohonan (Application)
        Route::prefix('permohonan-mobile')->group(function () {
            Route::get('/detail/{id}', [PermohonanController::class, 'detail']);
            Route::post('/simpan', [PermohonanController::class, 'simpan']);
            Route::get('/{idPersonal}', [PermohonanController::class, 'index']);
        });

        // Perjanjian (Agreement)
        Route::prefix('perjanjian-mobile')->group(function () {
            Route::get('/detail/{id}', [PerjanjianController::class, 'detail']);
            Route::get('/{idPersonal}', [PerjanjianController::class, 'index']);
        });

        // Pembayaran (Payment)
        Route::prefix('pembayaran-mobile')->group(function () {
            Route::get('/{idPersonal}', [PembayaranController::class, 'index']);
            Route::post('/', [PembayaranController::class, 'store']);
        });

        // Payment Status
        Route::get('/payment-status/{nomorTagihan}', [PembayaranController::class, 'paymentStatus']);

        // Objek Retribusi (Asset)
        Route::prefix('objek-retribusi-mobile')->group(function () {
            Route::get('/tarif', [ObjekRetribusiController::class, 'tarif']);
            Route::get('/detail/{id}', [ObjekRetribusiController::class, 'detail']);
            Route::get('/detail-tarif/{id}', [ObjekRetribusiController::class, 'detailTarif']);
        });

        // Combo / Dropdown data
        Route::get('/combo-jenis-permohonan', [ComboController::class, 'jenisPermohonan']);
        Route::get('/combo-dokumen-kelengkapan', [ComboController::class, 'dokumenKelengkapan']);
        Route::get('/combo-objek-retribusi', [ComboController::class, 'objekRetribusi']);
        Route::get('/combo-satuan', [ComboController::class, 'satuan']);
        Route::get('/combo-peruntukan-sewa', [ComboController::class, 'peruntukanSewa']);
        Route::get('/combo-perioditas', [ComboController::class, 'perioditas']);
    });
});
