<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FixedAssets extends Model
{
    use HasFactory;

    public function store_table()
    {
        return $this->belongsTo(Store::class, 'store_id', 'id');
    }
}
