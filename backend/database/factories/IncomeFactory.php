<?php

namespace Database\Factories;

use App\Models\Budget;
use App\Models\Income;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Carbon;

/**
 * @extends Factory<Income>
 */
class IncomeFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'title' => fake()->words(rand(2, 3), true),
            'description' => substr(fake()->sentence(), 0, 240),
            'amount' => rand(100, 9999),
        ];
    }

    public function withBudget(Budget $budget): IncomeFactory
    {
        return $this->state([
            'budget_id' => $budget->id,
            'transaction_date' => Carbon::make($budget->start_date)->addDays(rand(1, 28)),
        ]);
    }
}
