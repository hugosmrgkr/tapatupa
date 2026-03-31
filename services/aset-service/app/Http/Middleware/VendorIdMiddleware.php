<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class VendorIdMiddleware
{
    public function handle(Request $request, Closure $next): Response
    {
        $vendorId = $request->header('Vendor-ID');
        $expectedVendorId = config('app.vendor_id', env('VENDOR_ID', '2kadMK7vwBQp9tDEd2OqvSxuPYimFQoK'));

        if ($vendorId !== $expectedVendorId) {
            return response()->json([
                'status' => 401,
                'responseCode' => 401,
                'responseMessage' => 'Invalid Vendor ID',
            ], 401);
        }

        return $next($request);
    }
}
