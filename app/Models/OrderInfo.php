<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderInfo extends Model
{
    use HasFactory;

    protected $fillable = [
        'customer_id',
        'table_list_id',
        'order_no',
        'inv_no',
        'order_date_time',
        'order_date',
        'order_time',
        'check_out_status',
        'check_out_time',
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
    ];
}
