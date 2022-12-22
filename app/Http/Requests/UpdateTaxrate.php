<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateTaxrate extends FormRequest
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
        $id = $this->route('fixed_assets');
        return [
            'name' => 'required|unique:taxrates,name,' . $id,
            'taxrate' => 'required|numeric',
            'status' => 'required',
        ];
    }
}
