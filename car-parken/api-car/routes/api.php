<?php

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PlaceController;
use App\Http\Controllers\SectorController;
use App\Http\Controllers\ProfileController;


Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/user', function (Request $request) {
        return [
            'user' => $request->user(),
            'currentToken' => $request->bearerToken()
        ];
    });

    Route::put('/user/update/profile', [ProfileController::class, 'updateUserInfos']);
    Route::put('/user/update/password', [ProfileController::class, 'updateUserPassword']);
    Route::post('/user/logout', [User::class, 'logout']);
    Route::get('sectors', [SectorController::class, 'index']);
    Route::put('parking/{place}/start', [PlaceController::class, 'startParking']);
    Route::put('parking/{place}/end', [PlaceController::class, 'endParking']);


});

Route::post('user/register', [User::class, 'store']);
Route::post('user/login', [User::class, 'auth']);
