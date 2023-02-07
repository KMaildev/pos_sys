<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StockIn extends Model
{
    use HasFactory;

    public function ingredient_table()
    {
        return $this->belongsTo(Ingredients::class, 'ingredient_id', 'id');
    }

    public function store_table()
    {
        return $this->belongsTo(Store::class, 'store_id', 'id');
    }
}
