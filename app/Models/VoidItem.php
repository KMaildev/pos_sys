<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VoidItem extends Model
{
    use HasFactory;

    public function menu_list_table()
    {
        return $this->belongsTo(MenuList::class, 'menu_list_id', 'id');
    }
}
