<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\UserCreateRequest;
use App\Models\User;
use Exception;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Hash;

class UserCreateController extends Controller
{
    /**
     * Handle the incoming request.
     * @throws HttpResponseException
     */
    public function __invoke(UserCreateRequest $request): JsonResponse
    {
        try {
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
            ]);

            return response()->json([
                'token' => $user->createToken(name: 'auth_token', expiresAt: now()->addDays(7))->plainTextToken,
            ]);
        } catch (Exception $e) {
            throw new HttpResponseException(
                response()->json(
                    [
                        'message' => $e->getMessage(),
                    ],
                    Response::HTTP_INTERNAL_SERVER_ERROR
                )
            );
        }
    }
}
