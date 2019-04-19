//app.js
import util from 'utils/js/util.js';
import page from 'utils/js/page.js';
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
  globalData: {
    userInfo: null,
    pictureUrl: 'http://shop.changzhenlong.com',
  },
  siteInfo: require('siteinfo.js')
})