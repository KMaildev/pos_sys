<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TempFixedPurchaseItem extends Model
{
    use HasFactory;

    public function fixed_assets_table()
    {
        return $this->belongsTo(FixedAssets::class, 'temp_id', 'id');
    }
}
