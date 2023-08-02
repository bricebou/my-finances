<?php

namespace Database\Factories;

use App\Models\Budget;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Carbon;

/**
 * @extends Factory<Budget>
 */
class BudgetFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $date = Carbon::make(fake()->date());
        return [
            'title' => substr(fake()->sentence(rand(2, 4)), 0, 25),
            'start_date' => $date->startOfMonth()->toDate(),
            'end_date' => $date->endOfMonth()->toDate(),
        ];
    }

    public function withUser(User $user): BudgetFactory
    {
        return $this->state([
            'user_id' => $user->id,
        ]);
    }
}
