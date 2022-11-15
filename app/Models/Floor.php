<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Floor extends Model
{
    use HasFactory;

    public function table_lists_table()
    {
        return $this->hasMany(TableList::class, 'floor_id', 'id');
    }
}
