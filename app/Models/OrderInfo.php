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
        'waiter_user_id',
        'created_at',
        'updated_at',
        'guest_no',
        'change_amount',
        'order_minutes',
        'order_user_name',
    ];

    public function table_lists_table()
    {
        return $this->belongsTo(TableList::class, 'table_list_id', 'id');
    }

    public function customer_table()
    {
        return $this->belongsTo(Customer::class, 'customer_id', 'id');
    }

    public function waiter_user_table()
    {
        return $this->belongsTo(User::class, 'waiter_user_id', 'id');
    }

    public function cashier_user_table()
    {
        return $this->belongsTo(User::class, 'cashier_user_id', 'id');
    }

    public function order_items_table()
    {
        return $this->hasMany(OrderItem::class, 'order_info_id', 'id');
    }
}
