<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BillInfo extends Model
{
    use HasFactory;

    protected $fillable = [
        'order_info_id',
        'customer_id',
        'table_list_id',
        'bill_date_time',
        'bill_time',
        'payment_type',
        'total_amount',
        'tax_amount',
        'discount',
        'service_charges',
        'net_amount',
        'received_amount',
        'cashier_user_id',
        'created_at',
        'updated_at',
        'change_amount',
    ];
}
