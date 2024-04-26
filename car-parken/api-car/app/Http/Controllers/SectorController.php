<?php

namespace App\Http\Controllers;

use App\Models\Sector;
use Illuminate\Http\Request;
use App\Http\Resources\SectorResource;
use \Illuminate\Http\Resources\Json\AnonymousResourceCollection;
class SectorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return AnonymousResourceCollection
     */
    public function index() : AnonymousResourceCollection
    {
        return SectorResource::collection(Sector::all());
    }
    

}
