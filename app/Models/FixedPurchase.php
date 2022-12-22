<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FixedPurchase extends Model
{
    use HasFactory;

    public function supplier_table()
    {
        return $this->belongsTo(Supplier::class, 'supplier_id', 'id');
    }

    public function representative_table()
    {
        return $this->belongsTo(User::class, 'representative_id', 'id');
    }
}
