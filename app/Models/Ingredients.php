<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ingredients extends Model
{
    use HasFactory;

    public function stock_openings()
    {
        return $this->belongsTo(StockOpening::class, 'id', 'ingredient_id');
    }

    public function stock_openings_all()
    {
        return $this->hasMany(StockOpening::class, 'ingredient_id', 'id');
    }

    public function stock_ins_all()
    {
        return $this->hasMany(StockIn::class, 'ingredient_id', 'id');
    }

    public function ingredient_lists_all()
    {
        return $this->hasMany(IngredientList::class, 'ingredient_id', 'id');
    }

    public function damages_all()
    {
        return $this->hasMany(Damage::class, 'ingredient_id', 'id');
    }
}
