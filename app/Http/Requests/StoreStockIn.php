<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreStockIn extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'ingredient_id' => 'required',
            'stock_in_date' => 'required',
            'purchase_unit' => 'required|numeric',
            'price_per_unit' => 'required|numeric',
            'store_id' => 'required',
        ];
    }
}
