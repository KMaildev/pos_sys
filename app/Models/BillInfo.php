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
        'waiter_user_id',
        'date_only',
        'order_no',
        'inv_no',
        'first_table_id',
        'discount_amount',
        'refund_amount',
    ];

    public function order_infos_table()
    {
        return $this->belongsTo(OrderInfo::class, 'order_info_id', 'id');
    }

    public function table_lists_table()
    {
        return $this->belongsTo(TableList::class, 'table_list_id', 'id');
    }

    public function first_table_lists_table()
    {
        return $this->belongsTo(TableList::class, 'first_table_id', 'id');
    }

    public function customer_table()
    {
        return $this->belongsTo(Customer::class, 'customer_id', 'id');
    }

    public function cashier_user()
    {
        return $this->belongsTo(User::class, 'cashier_user_id', 'id');
    }

    public function waiter_user_table()
    {
        return $this->belongsTo(User::class, 'waiter_user_id', 'id');
    }

    public function payment_method_table()
    {
        return $this->belongsTo(PaymentMethod::class, 'payment_type', 'id');
    }

    public function order_items_table()
    {
        return $this->hasMany(OrderItem::class, 'order_info_id', 'order_info_id');
    }

    public function void_items_table()
    {
        return $this->hasMany(VoidItem::class, 'order_info_id', 'id');
    }
}
