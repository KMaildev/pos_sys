<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class updatePin extends FormRequest
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
        $id = $this->route('update_pin');
        return [
            'pin_code' => 'required|numeric|unique:users,pin_code,' . $id,
            'user_id' => 'required',
        ];
    }
}
