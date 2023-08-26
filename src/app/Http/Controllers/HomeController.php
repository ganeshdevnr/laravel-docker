<?php

namespace App\Http\Controllers;

class HomeController extends Controller
{
    public function getSampleJson()
    {
        $data = [
            'name' => 'Ganesh',
            'job' => 'Computer Programmer',
            'interests' => ['Productivity Tools', 'Programming', 'Communication Skills']
        ];

        return response()->json($data);
    }
}
