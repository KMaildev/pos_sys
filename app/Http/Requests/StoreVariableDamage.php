<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreVariableDamage extends FormRequest
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
            'variable_asset_id' => 'required',
            'damage_date' => 'required',
            'damage_qty' => 'required|numeric',
            'causes_of_accidents' => 'required',
        ];
    }
}
