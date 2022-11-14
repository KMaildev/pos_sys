<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TableList extends Model
{
    use HasFactory;

    public function floor_table()
    {
        return $this->belongsTo(Floor::class, 'floor_id', 'id');
    }
}
