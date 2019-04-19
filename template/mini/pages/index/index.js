var app = getApp();
Page({
  data: {
    showAuthView:false,
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (t) {
    var that = this;
    that.setQrcodeParameter(t);
    app.page.onLoad(that, t);
    app.util.request({
      url: 'Homepage/index',
      data: {
        id: 12138,
      },
      success: function (res) {
        if (res.code == 0) {
          that.setData(res.data)
        }
      }
    })
  },
  
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  },
  //授权扩展 start
  myLogin: function (e) {
    console.log(e);
    app.page.myLogin(this, e);
  },
  redirect: function (res) {
    wx.reLaunch({
      url: '/pages/index/index',
    })
  },
  //授权扩展 end
  //页面参数绑定
  setQrcodeParameter: function (t) {
    var that = this;
    if (t) {
      if (t.scene) {
        const scene = decodeURIComponent(t.scene);
        var arr = scene.split('/');
        var parent_id = arr[1];
        that.setData({ parent_id: parent_id })
      }
    }
  },
  //微信支付
  pay:function(){
    app.util.request({
      url:'Homepage/buyNow',
      method:'POST',
      data:{},
      success: function (res) {
        app.wechatpay.payelment(res.data);
      }
    })
  },
  
})