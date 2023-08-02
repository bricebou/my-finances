<?php

namespace App\Http\Resources\Budget;

use App\Http\Resources\Income\IncomeResource;
use App\Models\Income;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class BudgetResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'start_date' => $this->start_date,
            'end_date' => $this->end_date,
            'incomes' => IncomeResource::collection($this->whenLoaded('incomes')),
            'total_incomes' => round(intval(Income::where('budget_id', $this->id)->sum('amount')) / 100, 2),
        ];
    }
}
