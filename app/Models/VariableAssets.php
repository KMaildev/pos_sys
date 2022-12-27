<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VariableAssets extends Model
{
    use HasFactory;

    public function store_table()
    {
        return $this->belongsTo(Store::class, 'store_id', 'id');
    }

    public function variable_purchase_items()
    {
        return $this->hasMany(VariablePurchaseItem::class, 'fixed_asset_id', 'id');
    }
}
