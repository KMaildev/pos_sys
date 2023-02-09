<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TableList extends Model
{
    use HasFactory;

    public function floor_table()
    {
        return $this->belongsTo(Floor::class, 'floor_id', 'id');
    }

    public function order_infos_table()
    {
        return $this->belongsTo(OrderInfo::class, 'id', 'table_list_id')
            ->where('check_out_status', NULL)
            ->where('void_status', NULL)
            ->latest();
    }

    public function all_order_infos_table()
    {
        return $this->hasMany(OrderInfo::class, 'table_list_id', 'id')
            ->where('check_out_status', NULL)
            ->where('void_status', NULL);
    }


    public function bill_infos_table()
    {
        return $this->hasMany(BillInfo::class, 'table_list_id', 'id');
    }

    public function void_item_table()
    {
        return $this->belongsTo(VoidItem::class, 'id', 'table_list_id')->latest();
    }
}
