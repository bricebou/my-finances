<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $user = User::create([
            'name' => 'gamora',
            'email' => 'gamora@example.com',
            'password' => Hash::make('Pa$$W0rd'),
            'email_verified_at' => now(),
        ]);

        $user = User::create([
            'name' => 'salto',
            'email' => 'salto@example.com',
            'password' => Hash::make('Pa$$W0rd'),
        ]);
    }
}
