<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CartTemp extends Model
{
    use HasFactory;

    protected $fillable = [
        'menu_list_id',
        'qty',
        'price',
        'remark',
        'session_id',
        'user_id',
        'created_at',
        'updated_at'
    ];

    public function menu_lists_table()
    {
        return $this->belongsTo(MenuList::class, 'menu_list_id', 'id');
    }
}
