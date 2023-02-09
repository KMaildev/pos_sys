<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    use HasFactory;

    protected $fillable = [
        'menu_list_id',
        'qty',
        'price',
        'remark',
        'order_info_id',
        'waiter_user_id',
        'created_at',
        'updated_at',
        'preparation_status',
        'preparation_date',
        'preparation_user_id',
        'difference_time',
        'manager_remark',
        'menu_name',
        'order_date',
    ];

    public function menu_lists_table()
    {
        return $this->belongsTo(MenuList::class, 'menu_list_id', 'id');
    }

    public function ingredient_lists()
    {
        return $this->hasMany(IngredientList::class, 'menu_list_id', 'menu_list_id');
    }
}
