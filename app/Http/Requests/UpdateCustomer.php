<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateCustomer extends FormRequest
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
        $id = $this->route('customer');
        return [
            'name' => 'required',
            'primary_number' => 'required|min:9|max:11|unique:customers,primary_number,' . $id,
            // 'email' => 'required|email|unique:customers,email,' . $id,
        ];
    }
}
