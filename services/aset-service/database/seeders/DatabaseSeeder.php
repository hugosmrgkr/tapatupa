<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $this->call([
            ReferenceSeeder::class,
            AsetSeeder::class,
            UserSeeder::class,
            PerjanjianTagihanSeeder::class,
        ]);
    }
}
