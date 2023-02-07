<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DamageFiles extends Model
{
    use HasFactory;

    public function users_table()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
}
