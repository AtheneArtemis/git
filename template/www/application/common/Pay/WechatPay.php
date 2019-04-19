<?php
namespace app\common\Pay;

class WechatPay{
    

    //微信支付
    public function pay($data){
        $miniProgramInfo = db('miniprogram_parameter')->where('is_delete','0')->field('id,appid,appsecret,mch_id,mch_password,mch_key')->find();
        $unifiedorderRes = $this->unifiedorder($data['price'],$data['body'],$data['order_no'],$data['openid'],$miniProgramInfo);
        // var_dump($unifiedorderRes);
        $payParams = [
            'appId' => $miniProgramInfo['appid'],
            'timeStamp' => (string)time(),
            'nonceStr' => (string)mt_rand(10000000,99999999),
            'package' => "prepay_id=".$unifiedorderRes['prepay_id'],
            'signType' => 'MD5',
        ];
        ksort($payParams);
        $string2 = '';
        foreach($payParams as $key => $v) {
            if (empty($v)) {
                continue;
            }
            $string2 .= "{$key}={$v}&";
        }
        $string2 .= "key={$miniProgramInfo['mch_key']}";
        $payParams['paySign'] = strtoupper(md5($string2));

        return $payParams;
    }
    //微信支付 -- 统一下单
    public function unifiedorder($price,$body,$order_no,$openid,$miniProgramInfo){
        
        $url = 'https://api.mch.weixin.qq.com/pay/unifiedorder';
        $ip = get_client_ip();
        $notify_url = config('notify_url');

        $params = [
            'appid' => $miniProgramInfo['appid'],
            'mch_id' => $miniProgramInfo['mch_id'],
            'nonce_str' => (string)mt_rand(10000000,99999999),
            'body' => $body,
            'out_trade_no' => $order_no,
            'total_fee' => floatval($price) * floatval(100),
            'openid' => $openid,
            'spbill_create_ip' => $ip,
            'notify_url' => $notify_url,
            'trade_type' => 'JSAPI',
        ];
        ksort($params);
        $string1 = '';
        foreach($params as $key => $v) {
            if (empty($v)) {
                continue;
            }
            $string1 .= "{$key}={$v}&";
        }
        $string1 .= "key={$miniProgramInfo['mch_key']}";
        $params['sign'] = strtoupper(md5($string1));
        $params = array2xml($params);
        $apiRes = _http_wechat_pay($url,$params,'POST');
        $apiRes = xml2array($apiRes);

        return $apiRes;
    }



}