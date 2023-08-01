<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\UserUpdateRequest;
use App\Http\Resources\User\UserResource;

class UserUpdateController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(UserUpdateRequest $request): UserResource
    {
        $request->user()->update([
            'name' => $request->name,
            'email' => $request->email,
        ]);

        return new UserResource($request->user());
    }
}
