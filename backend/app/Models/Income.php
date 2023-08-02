<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Income extends Model
{
    use HasFactory;
    use HasUuids;

    protected $fillable = [
        'budget_id',
        'title',
        'description',
        'amount',
        'transaction_date',
    ];

    public function amount(): Attribute
    {
        return Attribute::make(
            get: fn(int $value): float => round($value / 100, 2),
            set: fn(float $value): int => $value * 100,
        );
    }

    public function budget(): BelongsTo
    {
        return $this->belongsTo(Budget::class);
    }
}
