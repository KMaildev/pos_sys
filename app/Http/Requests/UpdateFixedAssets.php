<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateFixedAssets extends FormRequest
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
        $id = $this->route('fixed_asset');
        return [
            'inventory_code' => 'required|unique:fixed_assets,inventory_code,' . $id,
            'description' => 'required',
            'unit' => 'required',
            'store_id' => 'required',
        ];
    }
}
