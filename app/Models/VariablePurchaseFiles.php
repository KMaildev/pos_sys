<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VariablePurchaseFiles extends Model
{
    use HasFactory;

    public function user_table()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
}
