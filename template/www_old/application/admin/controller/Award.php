<?php
namespace app\admin\controller;
use app\admin\controller\Publictable;

class Award extends Publictable{
    
    function _initialize(){
        parent::_initialize();
        $this->model = 'award';
        $this->controllername = '奖品列表';
        
    }
    function _filter(&$map,&$querycond){
        $map['is_delete'] = array('eq','0');
    }
    function _generatetabledatahtml($html,$id=null){
        
        $value =  db($this->model)->where("id",$id)->find();
        if ($value['status'] == 2) $status = '奖池中';
        else $status = '不在奖池';

        $html = $html.'
    		<tr>
    			<td class="bs-checkbox"><input data-index="3" name="btSelectItem" type="checkbox" value="'.$value["id"].'"></td>
                <td>'.$value["id"].'</td>
    			<td>'.$value["name"].'</td>
                <td>'.$value["number"].'</td>
                <td>'.$value["sort"].'</td>
    			<td>'.$status.'</td>
                <td>'.$value["note"].'</td>
                <td>
                    <a href="'.url('Award/edit',array('id'=>$value['id'])).'"><button class="btn btn-outline btn-default">修改</button></a>
                </td>
    		</tr>';
        return $html;
    }
    
    function index(){
    	// $this->getinitprovincecityzonelist(true);
        $this->_filter($map,$querycond);
        $this->_index($this->model,$map,$fields="id",$order='status desc,sort');

        $award_money = db('other_parameter')->where('is_delete','0')->field('id,award_money,card_number,card_money')->find();
        $this->assign('award_money',$award_money);

    	return $this->fetch(request()->controller().'/index');
    }
   
    public function saveMoney(){

        $id = getparameter('id');
        $awardMoneyInput = getparameter('awardMoneyInput');

        $res = db('other_parameter')->where('id',$id)->data(array('award_money'=>$awardMoneyInput))->update();

        if ($res) {
            $apiRes = [
                'code' => 0,
                'data' => '',
                'msg' => '保存成功'
            ];
        }else{
            $apiRes = [
                'code' => 1,
                'data' => '',
                'msg' => '系统繁忙'
            ];
        }
        return $apiRes;
    }
    public function saveCard(){

        $id = getparameter('id');
        $cardMoneyInput = getparameter('cardMoneyInput');
        $cardNumberInput = getparameter('cardNumberInput');

        $data = [
            'card_money' => $cardMoneyInput,
            'card_number' => $cardNumberInput,
        ];
        $res = db('other_parameter')->where('id',$id)->data($data)->update();

        if ($res) {
            $apiRes = [
                'code' => 0,
                'data' => '',
                'msg' => '保存成功'
            ];
        }else{
            $apiRes = [
                'code' => 1,
                'data' => '',
                'msg' => '系统繁忙'
            ];
        }
        return $apiRes;
    }
    
    
}