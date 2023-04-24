<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreSubmitPayment extends FormRequest
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
            'order_info_id' => 'required|unique:bill_infos,order_info_id',
            'payment_method_id' => 'required',
            'taxrate' => 'numeric',
            'disc' => 'numeric',
            'disc_amount' => 'numeric',
            'totalNetAmount' => 'numeric',
            'received_amount' => 'numeric',

            'service_charge' => 'numeric',
            'service_charge_amount' => 'numeric',
        ];
    }
}
