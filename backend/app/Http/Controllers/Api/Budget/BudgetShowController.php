<?php

namespace App\Http\Controllers\Api\Budget;

use App\Http\Controllers\Controller;
use App\Http\Resources\Budget\BudgetResource;
use App\Models\Budget;
use Illuminate\Http\Request;

class BudgetShowController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request): BudgetResource
    {
        return new BudgetResource(
            resource: Budget::where('id', $request->budget)->with('incomes')->first(),
        );
    }
}
