<?php

namespace App\Http\Controllers;
use Carbon\Carbon;
use App\Models\Place;
use App\Models\Sector;
use Illuminate\Http\Request;
use App\Http\Resources\PlaceResource;

class PlaceController extends Controller
{
    //
    public function startParking(Request $request, Place $place)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
        ]);

        if($place->where('user_id', $request->user_id)
            ->whereNull('end_time')->exists())
        {
            return response()->json([
                'error' => 'You have already started parking']);
        }



        $place->update([
            'user_id' => $request->user_id,
            //'start_time' => now(),
            'start_time' => $request->start_time,
            'available' => false,
            'end_time' => null,
            'total_price' => null,
        ]);

        $place->load('user','sector');
        return PlaceResource::make($place);
    }

    public function endParking( Place $place)
    {


        if($place->whereNull('end_time')->doesntExist())
        {
            return response()->json([
                'error' => 'You have already ended parking']);
        }

        $place->update([
            //'start_time' => now(),
            'available' => true,
            'end_time' => now(),
            'total_price' => $this->calculatePrice($place->sector_id,$place->start_time),
        ]);

        return PlaceResource::make($place);
    }

    public function calculatePrice($sector_id,$start_time)
    {
        $start = Carbon::createMidnightDate($start_time);
        $end = Carbon::createMidnightDate(now());
        $diff = $start->diffInHours($end);
        $sector_hourly_price = Sector::find($sector_id)->hourly_price;
        if($diff > 1)
        {
            return ceil($sector_hourly_price * $diff);
        }
        return $sector_hourly_price;
    }
}
