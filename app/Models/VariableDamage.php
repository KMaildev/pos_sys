<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VariableDamage extends Model
{
    use HasFactory;

    public function variable_asset_table()
    {
        return $this->belongsTo(VariableAssets::class, 'variable_asset_id', 'id');
    }
}
