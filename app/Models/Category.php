<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    public function order_items()
    {
        return $this->hasMany(OrderItem::class, 'categorie_id', 'id');
    }
}
