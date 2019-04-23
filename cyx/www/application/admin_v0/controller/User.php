<?php

namespace app\admin\Controller;
use app\admin\Controller\Admin;
class User extends Admin
{

    public function index()
    {
       /* $list = M('recharge')->join('LEFT JOIN lj_company_member ON lj_company_member.id=lj_recharge.cid')->where('lj_recharge.statu=1')->field('lj_recharge.*,lj_company_member.company,lj_company_member.type')->order('lj_recharge.createtime DESC')->select();
        $outline_list = M('outline_pay')->join('LEFT JOIN lj_company_member ON lj_company_member.id=lj_outline_pay.cid')->field('lj_outline_pay.*,lj_company_member.company')->select();
        $project_list = M('company_project')->join('LEFT JOIN lj_company_member ON lj_company_member.id=lj_company_project.company')->order('lj_company_project.createtime')->field('lj_company_project.*,lj_company_member.company')->select();
        $project_list = json_encode($project_list);
        $outline_list = json_encode($outline_list);
        $list = json_encode($list);

        $invoice = M('invoice')->select();
        $invoice = json_encode($invoice);
        $this->assign('invoice', $invoice);

        $this->assign('list', $list);
        $this->assign('outline_list', $outline_list);
        $this->assign('project_list', $project_list);*/
        return $this->fetch();
    }

    public function detail()
    {
       /* $id = I('get.id');
        $list = M('recharge')->join('LEFT JOIN lj_company_member ON lj_company_member.id=lj_recharge.cid')->where('lj_recharge.id=' . $id)->field('lj_recharge.*,lj_company_member.company,lj_company_member.type')->order('lj_recharge.createtime DESC')->find();

        $this->assign('list', $list);*/
        return $this->fetch();
    }

   /* public function del()
    {
        $id = I('post.id');
        $result = M('recharge')->delete($id);
        if ($result) {
            $json = array('code' => 0, 'msg' => '删除成功');
        } else {
            $json = array('code' => 1, 'msg' => '删除失败');
        }
        $this->ajaxReturn($json);
    }

    public function upload_ht()
    {
        $id = I('post.id');
        $contract = I('post.ht');
        $result = M('company_project')->where('id=' . $id)->save(array('contract' => $contract, 'contract_statu' => 1));
        if ($result) {
            $json = array('code' => 0, 'msg' => '提交成功');
        } else {
            $json = array('code' => 1, 'msg' => '提交失败');
        }
        $this->ajaxReturn($json);
    }*/
  public function invoicedetail()
    {
		return $this->fetch();
	}
}

