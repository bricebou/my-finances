<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class UserUploadAvatarRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'avatar' => 'required|image|max:512',
        ];
    }

    public function messages()
    {
        return [
            'avatar.required' => 'api_validation_avatar_required',
            'avatar.image' => 'api_validation_avatar_image',
            'avatar.max' => 'api_validation_avatar_max',
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
