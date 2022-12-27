<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VariablePurchaseItem extends Model
{
    use HasFactory;

    public function variable_assets_table()
    {
        return $this->belongsTo(VariableAssets::class, 'fixed_asset_id', 'id');
    }
}
