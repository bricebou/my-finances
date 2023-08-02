<?php

namespace App\Http\Controllers\Api\Budget;

use App\Http\Controllers\Controller;
use App\Http\Resources\Budget\BudgetResource;
use App\Models\Budget;
use Illuminate\Http\Request;

class BudgetShowLatestController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        return new BudgetResource(
            resource: Budget::where('user_id', $request->user()->id)
                ->with('incomes')
                ->orderBy('end_date', 'desc')
                ->first(),
        );
    }
}
