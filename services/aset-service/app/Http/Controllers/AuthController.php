<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
    public function loginMobile(Request $request)
    {
        $credentials = $request->only('username', 'password');

        if (empty($credentials['username']) || empty($credentials['password'])) {
            return response()->json([
                'status' => 422,
                'responseCode' => 422,
                'responseMessage' => 'Username dan password wajib diisi',
                'accessToken' => null,
                'userData' => [],
            ], 422);
        }

        $user = User::where('username', $credentials['username'])->first();

        if (!$user || !Hash::check($credentials['password'], $user->password)) {
            return response()->json([
                'status' => 401,
                'responseCode' => 401,
                'responseMessage' => 'Username atau password salah',
                'accessToken' => null,
                'userData' => [],
            ], 401);
        }

        try {
            $token = JWTAuth::fromUser($user);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'responseCode' => 500,
                'responseMessage' => 'Gagal membuat token',
                'accessToken' => null,
                'userData' => [],
            ], 500);
        }

        return response()->json([
            'status' => 200,
            'responseCode' => 200,
            'responseMessage' => 'Login berhasil',
            'accessToken' => $token,
            'userData' => [[
                'idPersonal' => $user->id_personal,
                'namaLengkap' => $user->nama_lengkap,
                'roleId' => $user->role_id,
                'fotoUser' => $user->foto ? asset('storage/' . $user->foto) : null,
            ]],
        ]);
    }
}
