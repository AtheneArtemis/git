//app.js
import util from 'utils/js/util.js';
import page from 'utils/js/page.js';
import wechatpay from 'utils/js/wechatpay.js';
import common from 'utils/js/common.js';
App({
  onLaunch: function () {
    //调用API从本地缓存中获取数据
  },
  onShow: function () {
  },
  onHide: function () {
  },
  onError: function (msg) {
    console.log(msg)
  },
  util: util,
  page: page,
  wechatpay: wechatpay,
  common: common,
  globalData: {
    userInfo: null,
  },
  siteInfo: require('siteinfo.js'),
})