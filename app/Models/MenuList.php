<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MenuList extends Model
{
    use HasFactory;

    public function category_table()
    {
        return $this->belongsTo(Category::class, 'categorie_id', 'id');
    }

    public function order_items_table()
    {
        return $this->hasMany(OrderItem::class, 'menu_list_id', 'id');
    }
}
