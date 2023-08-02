<?php

namespace App\Http\Controllers\Api\Budget;

use App\Http\Controllers\Controller;
use App\Http\Resources\Budget\BudgetCollection;
use App\Models\Budget;
use Illuminate\Http\Request;

class BudgetIndexController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request): BudgetCollection
    {
        return new BudgetCollection(
            resource: Budget::where('user_id', $request->user()->id)
                ->orderBy('end_date', 'desc')
                ->get(),
        );
    }
}
