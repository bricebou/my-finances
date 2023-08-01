<?php

use App\Http\Controllers\Api\Auth\LoginController;
use App\Http\Controllers\Api\Auth\LogoutController;
use App\Http\Controllers\Api\User\UserCreateController;
use App\Http\Controllers\Api\User\UserDeleteController;
use App\Http\Controllers\Api\User\UserShowController;
use App\Http\Controllers\Api\User\UserUpdateController;
use App\Http\Controllers\Api\User\UserUploadAvatarController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('/auth/login', LoginController::class);
Route::post('/auth/register', UserCreateController::class);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/auth/logout', LogoutController::class);
    Route::get('/user', UserShowController::class);
    Route::put('/user', UserUpdateController::class);
    Route::delete('/user', UserDeleteController::class);
    Route::post('/user/avatar', UserUploadAvatarController::class);
});
