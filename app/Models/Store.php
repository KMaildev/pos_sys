<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Store extends Model
{
    use HasFactory;

    public function store_type_table()
    {
        return $this->belongsTo(StoreType::class, 'store_types', 'id');
    }
}
