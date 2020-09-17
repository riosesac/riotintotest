<?php

namespace App\Http\Controllers\Service;

use Illuminate\Http\Request;

class Model
{
    function __get($name)
    {
        $namespace = '\\App\\Model\\' . $name;
        $this->name = new $namespace;
        return $this->name;
    }
}
