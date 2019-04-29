<?php
namespace app\admin\model;
use think\Model;
class Domain extends Model {

    protected $connection = [
        // 数据库类型
	    'type'        => 'mysql',
	    // 服务器地址
	    'hostname'    => $hostname,
	    // 数据库名
	    'database'    => $database,
	    // 数据库用户名
	    'username'    => $username,
	    // 数据库密码
	    'password'    => $password,
	    // 数据库连接端口
	    'hostport'    => '3306',
	    // 数据库编码默认采用utf8
	    'charset'     => 'utf8',
	    // 数据库表前缀
	    'prefix'      => $prefix,
    ];

}