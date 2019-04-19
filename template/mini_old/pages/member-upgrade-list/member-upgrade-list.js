// pages/detail/detail.js
var app = getApp();
var WxParse = require('../../utils/js/wxParse/wxParse.js');
Page({
  data: {
    showAuthView: false,
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (e) {
    // app.page.onLoad(this, e);
    app.page.isAccess(this, e);
    var that = this;
    if (e) {
      if (e.cat_id) {
        that.setData({ cat_id: e.cat_id})
      }
    }
    app.util.request({
      url: 'eastshop/Personal/memberUpgradeList',
      data: {
        cat_id: that.data.cat_id,
      },
      success: function (res) {
        if (res.data.code == 0) {
          that.setData({
            product: res.data.data,
          })
        }
      }
    })
  },
  
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function() {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function(e) {
    if (e.from === 'button') {
      // 来自页面内转发按钮
    }
    var shareinfo = this.data.shareinfo;
    return {
      title: shareinfo.title,
      path: shareinfo.path,
      imageUrl: shareinfo.imageUrl,
    }
  },
  firstPage:function (e){
    // console.log(e);
    wx.reLaunch({
      url: '/pages/index/index',
    })
  },
  
  buyNow:function(e){
    
  },
  myLogin: function (e) {
    app.page.myLogin(this, e);
  },
  redirect: function (res) {
    // console.log(this.data);
    wx.redirectTo({
      url: '/pages/member-upgrade/member-upgrade?id='+this.data.id+'&parent_id='+this.data.parent_id,
    })
  }
})