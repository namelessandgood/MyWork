<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class ProfileController extends Controller
{

    /**
     * Get the authenticated User
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function udateUserInfos(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        auth()->user()->update([
            'name' => $request->name,
        ]);

        return response()->json([
            'user' => auth()->user(),
        ]);
    }

    /**
     * Update the authenticated User password
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function udateUserPassword(Request $request)
    {
        $request->validate([
            'current_password' => 'required|current_password',
            'password' => 'required|max:255',
        ]);

        auth()->user()->update([
            'password' => Hash::make($request->password)
        ]);

        return response()->json([
            'user' => auth()->user(),
        ]);
    }


}
