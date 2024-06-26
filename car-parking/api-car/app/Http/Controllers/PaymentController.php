<?php

namespace App\Http\Controllers;

use Stripe\Stripe;
use ErrorException;
use Stripe\PaymentIntent;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    //
    public function payByStripe(Request $request)
    {
        Stripe::setApiKey('sk_test_3M749AJJ6re1nfC9t1WYe8Xa');
        try {
            $paymentIntent = PaymentIntent::create([
                'amount' => $request->amount * 100,
                'currency' => 'usd',
                'description' => 'React Parking App',
                'setup_future_usage' => 'on_session'
            ]);
            
            $output = [
                'clientSecret' => $paymentIntent->client_secret,
            ];
            return response()->json($output);
            
        } catch (ErrorException $e) {
            return response()->json(['error' => $e->getMessage()]);
        }
    }
}
