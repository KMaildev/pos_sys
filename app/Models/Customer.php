<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;


    public function bill_table()
    {
        return $this->hasMany(BillInfo::class, 'customer_id', 'id');
    }
    
}
