<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(LoginRequest $request): JsonResponse
    {
        $user = User::where('email', $request->email)->first();

        if ($user && Hash::check($request->password, $user->password)) {
            return response()->json([
                'token' => $user->createToken(name: 'auth_token', expiresAt: now()->addDays(7))->plainTextToken,
            ]);
        } else {
            return response()->json([
                'errors' => ['login' => 'api_login_error_no_record']
            ], 401);
        }
    }
}
