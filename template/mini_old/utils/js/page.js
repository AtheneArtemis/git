module.exports = {
  currentPage: null,
  currentPageOptions: {},
  navbarPages: [ "pages/index/index"],
  onLoad: function(t, e) {
    this.currentPage = t, this.currentPageOptions = e;
    
    var session_id = this.getStorageSync('session_id');
    var user_id = this.getStorageSync('user_id');
    if (!session_id || !user_id) { t.setData({ showAuthView:true}) }
  },
  isAccess:function(t,e){
    this.currentPage = t, this.currentPageOptions = e;

    var session_id = this.getStorageSync('session_id');
    var user_id = this.getStorageSync('user_id');
    if (!session_id || !user_id) { 
      wx.reLaunch({
        url: '/pages/index/index',
      })
    }
  },
  getStorageSync:function (e) {
    try {
      const value = wx.getStorageSync(e);
      if (value) {
        return value;
      }
    } catch (e) {}
  },
  scene_decode: function (t) {
    var e = (t + "").split(","), r = {};
    for (var n in e) {
      var a = e[n].split(":");
      0 < a.length && a[0] && (r[a[0]] = a[1] || null);
    }
    return r;
  },
  myLogin: function (t,e) {
    // console.log(t.data.parent_id);
    if (!t.data.parent_id){
      var parent_id = 0; 
    }else{
      var parent_id = t.data.parent_id;
    }
    var that = this;
    wx.login({
      success(res) {
        if (res.code) {
          getApp().util.request({
            url: 'eastshop/ApiEntrance/miniProgramLogin',
            data: {
              code: res.code,
              // encryptedData: e.detail.encryptedData,
              // signature: e.detail.signature,
              nickname:e.detail.userInfo.nickName,
              avatar_url: e.detail.userInfo.avatarUrl,
              parent_id: parent_id,
            },
            success:function(res){
              // console.log(res.data);
              if (res.data.code == 0){
                wx.setStorage({ key: 'session_id', data: res.data.data.session_id}),
                wx.setStorage({ key: 'user_id', data: res.data.data.user_id })
                t.setData({ showAuthView: false });
                t.redirect();
              }else{
                wx.showModal({
                  title: '提示',
                  // content: res.data.data.msg,
                  content: '授权失败',
                  showCancel: false,
                })
              }
            }
          })
        } else {
          console.log('登录失败！' + res.errMsg)
        }
      }
    })
  },
  
};