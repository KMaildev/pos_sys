<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FixedAssets extends Model
{
    use HasFactory;

    public function store_table()
    {
        return $this->belongsTo(Store::class, 'store_id', 'id');
    }

    public function fixed_purchase_items()
    {
        return $this->hasMany(FixedPurchaseItem::class, 'fixed_asset_id', 'id');
    }
}
