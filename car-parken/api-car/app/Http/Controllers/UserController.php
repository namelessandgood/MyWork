<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redis;

class UserController extends Controller
{
    //
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|string|max:255',
            'password' => 'required|min:8|max:255',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        return response()->json([
            'user'=>$user,
            'access_token'=>$user->createToken('new_user')->plainTextToken,
        ]);

    }

    public function auth(Request $request)
    {
        $request->validate([
            'email' => 'required|email|string|max:255',
            'password' => 'required|min:8|max:255',
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                'error' => 'Invalid credentials',
            ]);
        }

        return response()->json([
            'user'=>$user,
            'access_token'=>$user->createToken('login_user')->plainTextToken,
        ]);
    }

    public function  logout(Request $request){
        $request->user()->currentAccessToken()->delete();
        return response()->noContent();
    }

}
