<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class Place extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'available', 'sector_id', 'user_id', 'start_time', 'end_time', 'total_price'];

    protected $casts = [
        'start_time' => 'datetime',
        'end_time' => 'datetime',
    ];

    public function sector(): BelongsTo
    {
        return $this->belongsTo(Sector::class);
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function getStartTimeAttribute($value): string
    {
        return Carbon::parse($value)->format('Y-m-d H:i:s');
    }
    
}
