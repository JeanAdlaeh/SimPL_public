<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CmsEnvModel extends Model
{
	protected $table = 'vcms_env';	
	protected $primaryKey = 'var_key';
	public $timestamps = false;
    public $incrementing = false;


    //
}
