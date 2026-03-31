<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        User::create([
            'username' => 'admin',
            'password' => Hash::make('password123'),
            'email' => 'admin@aset.go.id',
            'nama_lengkap' => 'Administrator Sistem',
            'nomor_hp' => '081234567890',
            'alamat' => 'Jl. Pemerintah No. 1',
            'role_id' => 1,
            'id_personal' => 'PRS-ADMIN-001',
        ]);

        User::create([
            'username' => 'budi.santoso',
            'password' => Hash::make('password123'),
            'email' => 'budi.santoso@email.com',
            'nama_lengkap' => 'Budi Santoso',
            'nomor_hp' => '081234567891',
            'alamat' => 'Jl. Mawar No. 5, RT 01/RW 02',
            'role_id' => 2,
            'id_personal' => 'PRS-0001',
        ]);

        User::create([
            'username' => 'siti.rahayu',
            'password' => Hash::make('password123'),
            'email' => 'siti.rahayu@email.com',
            'nama_lengkap' => 'Siti Rahayu',
            'nomor_hp' => '081234567892',
            'alamat' => 'Jl. Melati No. 10, RT 03/RW 01',
            'role_id' => 2,
            'id_personal' => 'PRS-0002',
        ]);

        User::create([
            'username' => 'eko.purnomo',
            'password' => Hash::make('password123'),
            'email' => 'eko.purnomo@email.com',
            'nama_lengkap' => 'Eko Purnomo',
            'nomor_hp' => '081234567893',
            'alamat' => 'Jl. Anggrek No. 15, RT 02/RW 03',
            'role_id' => 2,
            'id_personal' => 'PRS-0003',
        ]);
    }
}
