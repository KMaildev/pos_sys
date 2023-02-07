<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StockTransfer extends Model
{
    use HasFactory;

    public function ingredient_table()
    {
        return $this->belongsTo(Ingredients::class, 'ingredient_id', 'id');
    }

    public function location_from()
    {
        return $this->belongsTo(Store::class, 'location_from_store_id', 'id');
    }

    public function to_location()
    {
        return $this->belongsTo(Store::class, 'to_location_store_id', 'id');
    }
}
