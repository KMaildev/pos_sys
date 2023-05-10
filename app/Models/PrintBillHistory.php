<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PrintBillHistory extends Model
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
        'waiter_user_id',
        'date_only',
        'order_no',
        'inv_no',
        'first_table_id',
        'discount_amount',
        'refund_amount',
        'service_charge_amount',
    ];
}
