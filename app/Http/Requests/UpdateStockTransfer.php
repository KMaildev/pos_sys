<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateStockTransfer extends FormRequest
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
            'transfer_date' => 'required',
            'transfer_unit' => 'required|numeric',
            'location_from_store_id' => 'required',
            'to_location_store_id' => 'required',
        ];
    }
}
