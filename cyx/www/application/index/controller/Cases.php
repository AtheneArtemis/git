<?php
namespace app\index\Controller;
use app\index\Controller\Index;
class Cases extends Index{
 	public function index(){

 		$customertype = db('customertype');
 		$customer = db('customer');
 		$list = $customertype->where(['is_delete'=>0])->select();
 		foreach ($list as $k1 => &$v1) {
 			$v1['customer'] = $customer->where(['is_delete'=>0,'customertype_id'=>$v1['id']])->select();
 		}

 		$this->assign('list',$list);
       	return $this->fetch(request()->controller().'/'.request()->action());
    }
}