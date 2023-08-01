<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\UserUploadAvatarRequest;
use App\Http\Resources\User\UserResource;

class UserUploadAvatarController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(UserUploadAvatarRequest $request): UserResource
    {
        $user = $request->user();
        $user->clearMediaCollection('avatars');

        $user->addMedia($request->avatar)
            ->toMediaCollection('avatars');

        return new UserResource($user);
    }
}
