// pages/my/my.js
var app = getApp();
Page({
  data: {

  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    app.page.isAccess(this, options);
    // var that = this;
    // app.util.request({
    //   url:'eastshop/Personal/homepage',
    //   success:function(res){
    //     // console.log(res);
    //     var data = res.data
    //     if (data.code == 0){
    //       that.setData({
    //         userinfo:data.userinfo,
    //         stock: data.stock,
    //         earnings: data.earnings,
    //       })
    //     }
    //   }
    // })
  },
  makePhoneCall:function(e){
    var that = this;
    var mobile;
    if (that.data.setting.mobile == '' || !that.data.setting.mobile){
      mobile = '0';
    }else{
      mobile = that.data.setting.mobile;
    }
    wx.makePhoneCall({
      phoneNumber: mobile
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
    var that = this;
    app.util.request({
      url: 'eastshop/Personal/homepage',
      success: function (res) {
        // console.log(res);
        var data = res.data
        if (data.code == 0) {
          that.setData({
            userinfo: data.userinfo,
            stock: data.stock,
            earnings: data.earnings,
            setting: data.setting,
          })
        }
      }
    })
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

  }
})