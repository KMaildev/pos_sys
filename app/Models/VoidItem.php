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

    public function table_list_table()
    {
        return $this->belongsTo(TableList::class, 'table_list_id', 'id');
    }


    public function void_by_table()
    {
        return $this->belongsTo(User::class, 'void_by', 'id');
    }
}
