<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Budget;
use App\Models\Income;
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
        $gamora = User::create([
            'name' => 'gamora',
            'email' => 'gamora@example.com',
            'password' => Hash::make('Pa$$W0rd'),
            'email_verified_at' => now(),
        ]);

        $gamora->addMediaFromUrl('https://ui-avatars.com/api/?name=' . $gamora->name . '&size=256&background=random')
            ->toMediaCollection('avatars');

        $salto = User::create([
            'name' => 'salto',
            'email' => 'salto@example.com',
            'password' => Hash::make('Pa$$W0rd'),
        ]);

        $salto->addMediaFromUrl('https://ui-avatars.com/api/?name=' . $salto->name . '&size=256&background=random')
            ->toMediaCollection('avatars');


        $users = [$gamora, $salto];

        foreach ($users as $user) {
            Budget::factory(5)
                ->withUser($user)
                ->create()
                ->each(function (Budget $budget) {
                    Income::factory(rand(1, 3))->withBudget($budget)->create();
                });
        }
    }
}
