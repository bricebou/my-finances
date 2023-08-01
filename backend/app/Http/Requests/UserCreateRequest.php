<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class UserCreateRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'name' => 'required|min:3',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:12'
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'api_validation_name_required',
            'name.min' => 'api_validation_name_min',
            'email.required' => 'api_validation_email_required',
            'email.email' => 'api_validation_email_email',
            'email.unique' => 'api_validation_email_unique',
            'password.required' => 'api_validation_password_required',
            'password.min' => 'api_validation_password_min',
        ];
    }

    /**
     * @throws HttpResponseException
     */
    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            response()->json(
                [
                    'message' => 'api_validation_errors',
                    'errors' => $validator->errors(),
                ],
                400
            )
        );
    }
}
